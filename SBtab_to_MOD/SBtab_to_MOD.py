import argparse
import json
import os
import re
from datetime import datetime
import numpy as np
import pandas as pd
import sympy
import quantities as pq

# ==========================================
# 1. PARSER LAYER FOR SEPARATE TSV FILES
# ==========================================
def parse_tsv_file(file_path: str) -> pd.DataFrame:
    """Parses an individual TSV table file, locating the header starting with '!'."""
    if not os.path.exists(file_path):
        return None

    lines = []
    with open(file_path, "r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("%") or line.startswith("!!"):
                continue
            lines.append(line)

    if not lines:
        return None

    split_rows = [l.split("\t") for l in lines]

    h_idx = 0
    for i, r in enumerate(split_rows):
        if r and r[0].startswith("!"):
            h_idx = i
            break

    headers = split_rows[h_idx]
    data_rows = split_rows[h_idx + 1 :]

    df = pd.DataFrame(data_rows, columns=headers).replace(r"^\s*$", None, regex=True)
    if not df.empty:
        df.set_index(headers[0], inplace=True)
    return df


def parse_sbtab_folder(folder_path: str) -> dict[str, pd.DataFrame]:
    """Scans a directory for TSV files and maps them to standard SBtab equivalents."""
    if not os.path.isdir(folder_path):
        raise FileNotFoundError(f"Provided path is not a directory: {folder_path}")

    tables = {}
    for filename in os.listdir(folder_path):
        if not filename.endswith(".tsv"):
            continue

        base_name = os.path.splitext(filename)[0]
        file_path = os.path.join(folder_path, filename)
        df = parse_tsv_file(file_path)

        if df is None:
            continue

        lower_base = base_name.lower()
        if "reaction" in lower_base:
            tables["Reaction"] = df
        elif "compound" in lower_base:
            tables["Compound"] = df
        elif "constant" in lower_base:
            tables["Constant"] = df
        elif "parameter" in lower_base:
            tables["Parameter"] = df
        elif "expression" in lower_base:
            tables["Expression"] = df
        elif "input" in lower_base:
            tables["Input"] = df
        elif "output" in lower_base:
            tables["Output"] = df
        else:
            tables[base_name] = df

    return tables


# ==========================================
# 2. STRUCTURAL EXTRACTION CORE UTILITIES
# ==========================================
def _get_logical(series: pd.Series) -> pd.Series:
    if series is None or series.empty:
        return pd.Series(dtype=bool)
    return series.apply(lambda v: str(v).strip().upper() in ["1", "TRUE", "T"])


def _optional_column(df: pd.DataFrame, col_name: str, mode: str = "logical") -> pd.Series:
    if df is None or df.empty or col_name not in df.columns:
        fallback = False if mode == "logical" else (0.0 if mode == "numeric" else "")
        return pd.Series([fallback] * len(df), index=df.index if df is not None else None)
    if mode == "logical":
        return _get_logical(df[col_name])
    elif mode == "numeric":
        return pd.to_numeric(df[col_name], errors="coerce").fillna(0.0)
    return df[col_name].astype(str).fillna("")


def _sbtab_quantity_with_name(df: pd.DataFrame) -> tuple[pd.Series, str]:
    """
    Locates the numeric quantity column in an SBtab table by matching exact headers,
    partial extensions (e.g., '!Value:linspace'), or fallback default columns.
    Returns both the values series and the matched column name string.
    """
    col = None
    for c in df.columns:
        if str(c).startswith("!Value"):
            col = c
            break
    if col is None and "!DefaultValue" in df.columns:
        col = "!DefaultValue"
    if col is None:
        col = df.columns[0]
    return pd.to_numeric(df[col], errors="coerce").fillna(0.0), str(col)


def _sbtab_quantity(df: pd.DataFrame) -> pd.Series:
    vals, _ = _sbtab_quantity_with_name(df)
    return vals


def get_reactions(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Reaction")
    if df is None or df.empty:
        return pd.DataFrame(columns=["Flux", "Formula", "IsReversible"])
    return pd.DataFrame({
        "Flux": df.get("!KineticLaw", ""),
        "Formula": df.get("!ReactionFormula", ""),
        "IsReversible": _optional_column(df, "!IsReversible", "logical")
    }, index=df.index)


def get_constants(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Constant")
    if df is None or df.empty: return None
    if "!Name" in df.columns:
        df = df.copy().set_index("!Name")
    return pd.DataFrame({"Value": _sbtab_quantity(df), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_compounds(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Compound")
    if df is None or df.empty:
        raise KeyError("Could not locate a valid 'Compound' TSV data block in the specified folder.")
        
    names = df["!Name"].astype(str) if "!Name" in df.columns else df.index.astype(str)
    clean_iv = df["!InitialValue"].astype(str).str.replace("−", "-")
    
    return pd.DataFrame({
        "Name": names,
        "InitialValue": clean_iv,
        "SteadyState": _optional_column(df, "!SteadyState", "logical"),
        "Unit": df.get("!Unit", "1"),
        "IsConstant": _optional_column(df, "!IsConstant", "logical"),
        "Assignment": _optional_column(df, "!Assignment", "character"),
        "Interpolation": _optional_column(df, "!Interpolation", "logical"),
        "USEION": _optional_column(df, "USEION", "character"),
        "READ": _optional_column(df, "READ", "character"),
        "WRITE": _optional_column(df, "WRITE", "character"),
        "VALENCE": _optional_column(df, "VALENCE", "numeric"),
    }, index=df.index)


def get_expressions(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Expression")
    if df is None or df.empty: return None
    if "!Name" in df.columns:
        df = df.copy().set_index("!Name")
    return pd.DataFrame({"Formula": df.get("!Formula", ""), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_parameters(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Parameter")
    if df is None or df.empty:
        return pd.DataFrame(columns=["Value", "Unit"])
    
    df = df.copy()
    if "!Name" in df.columns:
        df.set_index("!Name", inplace=True)
        
    scale = _optional_column(df, "!Scale", "character")
    values, target_col = _sbtab_quantity_with_name(df)
    values = values.copy()

    if ":" not in target_col:
        for idx, s in scale.items():
            s_str = str(s).lower().strip()
            if "log10" in s_str or "base-10" in s_str:
                values.at[idx] = 10 ** values.at[idx]
            elif "ln" in s_str or "log" in s_str or "natural" in s_str:
                values.at[idx] = np.exp(values.at[idx])
                
    return pd.DataFrame({"Value": values, "Unit": df.get("!Unit", "1")}, index=df.index)


def get_outputs(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Output")
    if df is None or df.empty:
        return pd.DataFrame(columns=["Formula", "Unit"])
    if "!Name" in df.columns:
        df = df.copy().set_index("!Name")
    return pd.DataFrame({"Formula": df.get("!Formula", ""), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_inputs(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Input")
    if df is None or df.empty:
        return None
    df = df.copy()
    if "!Name" in df.columns:
        df.set_index("!Name", inplace=True)
    mask = ~_optional_column(df, "!ConservationLaw", "logical")
    filtered_df = df[mask]
    return None if filtered_df.empty else pd.DataFrame({"DefaultValue": _sbtab_quantity(filtered_df), "Unit": filtered_df.get("!Unit", "1")}, index=filtered_df.index)


# ==========================================
# 3. COMPILATION AND CONSERVATION ANALYZERS
# ==========================================
def update_ode_and_stoichiometry(term_list: list[str], compound_df: pd.DataFrame, expression_df: pd.DataFrame, input_df: pd.DataFrame) -> dict:
    J, C = [], []
    last_compound = ""
    for term in term_list:
        term = term.strip()
        if not term: continue
        xb = [part for part in re.split(r"[* ]", term) if part.strip()]
        compound = xb[1].strip() if len(xb) > 1 else xb[0].strip()
        try:
            n = int(float(xb[0])) if len(xb) > 1 else 1
        except ValueError:
            n = 1
        last_compound = compound
        if compound in compound_df.index:
            j = list(compound_df.index).index(compound) + 1
        elif (expression_df is not None and compound in expression_df.index) or (input_df is not None and compound in input_df.index):
            j = -1
        else:
            j = -2
        J.append(j)
        C.append(n)
    return {"n": C, "compound": last_compound, "J": J}


def parse_reaction_formulae(compound_df: pd.DataFrame, reaction_df: pd.DataFrame, expression_df: pd.DataFrame, input_df: pd.DataFrame) -> dict:
    n_c = len(compound_df)
    N = np.zeros((n_c, len(reaction_df)))
    ODE = [""] * n_c
    lhs_list, rhs_list = [], []

    for i, (rxn_id, row) in enumerate(reaction_df.iterrows()):
        formula = str(row["Formula"])
        parts = re.split(r"<=>|->|<->|=", formula)
        lhs = parts[0].strip() if len(parts) > 0 else ""
        rhs = parts[1].strip() if len(parts) > 1 else ""
        lhs_list.append(lhs)
        rhs_list.append(rhs)

        a = [x.strip() for x in lhs.split("+") if x.strip()]
        b = [x.strip() for x in rhs.split("+") if x.strip()]

        term_b = update_ode_and_stoichiometry(b, compound_df, expression_df, input_df)
        for k in range(len(b)):
            j = term_b["J"][k]
            if j > 0:
                idx = j - 1
                val = term_b["n"][k]
                coeff_b = f"{val}*" if val > 1 else ""
                ODE[idx] = f"{ODE[idx]}+{coeff_b}{rxn_id}"
                N[idx, i] += val

        term_a = update_ode_and_stoichiometry(a, compound_df, expression_df, input_df)
        for k in range(len(a)):
            j = term_a["J"][k]
            if j > 0:
                idx = j - 1
                val = term_a["n"][k]
                coeff_a = f"{val}*" if val > 1 else ""
                ODE[idx] = f"{ODE[idx]}-{coeff_a}{rxn_id}"
                N[idx, i] -= val

    for idx in range(n_c):
        if ODE[idx].startswith("+"): ODE[idx] = ODE[idx][1:]
        if not ODE[idx]: ODE[idx] = "0"
    return {"ODE": ODE, "Stoichiometry": N, "LHS": lhs_list, "RHS": rhs_list}


def get_conservation_laws(N: np.ndarray) -> np.ndarray:
    M_sym = sympy.Matrix(N.T).nullspace()
    if not M_sym: return None
    M = np.column_stack([np.array(v).astype(float) for v in M_sym])
    if M.shape[1] > 1:
        M = np.array(sympy.Matrix(M.T).rref()[0]).astype(float).T
    else:
        max_val = np.max(np.abs(M))
        if max_val > 0: M = M / max_val
    nr = M.copy()
    for f in [1, 2, 3, 5, 7]:
        scaled = nr * f
        if np.allclose(scaled, np.round(scaled), atol=1e-6):
            nr = scaled
            break
    laws = np.round(nr).astype(int)
    return laws[:, ::-1] if laws.shape[1] > 1 else laws


def get_law_text(laws: np.ndarray, compound_names: list[str], initial_values: list[float]) -> pd.DataFrame:
    n_laws, n_c = laws.shape[1], len(compound_names)
    con_law = {"Constant": [], "Eliminates": [], "Formula": [], "ConstantName": [], "Text": []}
    allowed = np.ones(n_c, dtype=bool)

    for j in range(n_laws):
        l = laws[:, j]
        p, n = l > 0, l < 0
        def _append(mask, sep):
            parts = [f"{abs(l[idx])}*{compound_names[idx]}" if abs(l[idx]) != 1 else compound_names[idx] for idx in np.where(mask)[0]]
            return sep.join(parts) if parts else ""

        pos_str = _append(p, '+')
        neg_str = _append(n, '-')
        
        if pos_str and neg_str:
            law_text = f"{pos_str}-{neg_str}"
        elif pos_str:
            law_text = pos_str
        else:
            law_text = f"-{neg_str}" if neg_str else "0"

        if not any((p | n) & allowed): continue
        indices = np.where((p | n) & allowed)[0]
        k = indices[np.argmax([initial_values[idx] for idx in indices])]
        allowed[k] = False
        const_name = f"{compound_names[k]}_cc"
        con_law["ConstantName"].append(const_name)
        con_law["Text"].append(f"{const_name} = {law_text.replace('1*', '')}")
        
        m = np.arange(n_c) != k
        pos_m_str = _append(p & m, '+')
        neg_m_str = _append(n & m, '-')
        
        if pos_m_str and neg_m_str:
            formula = f"{pos_m_str}-{neg_m_str}"
        elif pos_m_str:
            formula = pos_m_str
        else:
            formula = f"-{neg_m_str}" if neg_m_str else "0"

        con_law["Formula"].append(formula.replace("1*", ""))
        con_law["Constant"].append(float(np.dot(l, initial_values)))
        con_law["Eliminates"].append(k + 1)
    return pd.DataFrame(con_law, index=[compound_names[idx - 1] for idx in con_law["Eliminates"]])


# ==========================================
# 4. MOD WRITER LAYOUT ENGINE
# ==========================================
def wrap_expression(expr: str, max_len: int = 100, indent: str = "\t\t") -> str:
    """Wraps long mathematical formulas across multiple lines at operator boundaries to satisfy NMODL rules."""
    if len(expr) <= max_len:
        return expr
    
    lines = []
    current_line = ""
    
    for i, char in enumerate(expr):
        current_line += char
        if char in ('+', '-') and len(current_line) >= max_len:
            # Avoid breaking inside scientific notations (e.g., 1e-5 or 1e+5)
            if i > 0 and expr[i-1].lower() == 'e':
                continue
            lines.append(current_line)
            current_line = indent
            
    if current_line and current_line != indent:
        lines.append(current_line)
    return "\n".join(lines)


def one_or_more_lines(prefix: str, table: pd.DataFrame, suffix: str, name_map: dict = None) -> list[str]:
    if table is None or table.empty: return []
    raw_names = [str(idx) for idx in table.index]
    names_list = []
    for name in raw_names:
        mapped_name = name_map.get(name, name) if name_map else name
        if mapped_name != name:
            names_list.append(f"{mapped_name} : original name: {name}")
        else:
            names_list.append(mapped_name)
            
    single_line = f"{prefix} {', '.join([n.split(':')[0].strip() for n in names_list])} {suffix}"
    if len(single_line) < 76:
        return [single_line]
    else:
        return [f"{prefix} {name} {suffix}" for name in names_list]


def neuron_unit(unit_str: str) -> str:
    """Uses the quantities package to safely parse and format NMODL friendly unit symbols."""
    if not isinstance(unit_str, str) or pd.isna(unit_str) or unit_str.strip() in ["", "1", "dimensionless"]:
        return ""
    try:
        clean_str = unit_str.replace("−", "-").replace("M", "mol/L")
        q_unit = pq.Quantity(1.0, clean_str).units
        formatted = str(q_unit.dimensionality).strip()
        formatted = re.sub(r"^\(1/([a-zA-Z_]+)\)$", r"/\1", formatted)
        formatted = formatted.replace("(", "").replace(")", "").replace("**", "")
        return formatted
    except Exception:
        return re.sub(r"\s*\*\s*", "-", re.sub(r"[()]", "", re.sub(r"^\s*1/", "/", unit_str)))


def process_unit_and_value(value: float, unit_str: str) -> tuple[float, str]:
    """Handles unit updates to standard NEURON time-bounds and concentration terms."""
    if not isinstance(unit_str, str) or pd.isna(unit_str) or unit_str.strip() in ["", "1", "dimensionless"]:
        return value, ""
    try:
        clean_str = unit_str.replace("−", "-")
        
        if "nanomole" in clean_str and "millimole" not in clean_str:
            clean_str = clean_str.replace("nanomole", "millimole")
            value = value * 1e6
            
        q = value * pq.Quantity(1.0, clean_str)
        return float(q.magnitude), neuron_unit(clean_str)
    except Exception:
        pass
    return value, neuron_unit(unit_str)


def make_mod(H, constant, parameter, input_df, expression, reaction, compound, ode, name_map, con_law=None, config=None):
    if config is None:
        config = {}
    pointers_config = config.get("pointers", {})
    ions_config = config.get("ions", {})

    def tr(name):
        return name_map.get(str(name), str(name))

    mod = {}
    fmt = {
        "const": "\t{} = {} ({}) : a constant ({})",
        "par": "\t{} = {} ({}): {} ({})",
        "input": "\t{}  = {} ({}) : an input ({})",
        "total": "\t{} = {} : total amount for subset ({})",
        "ConservationLaw": "\t{} = {} : conservation law for ({})",
        "expression": "\t{} : pre-defined algebraic expression ({})",
        "flux": "\t{} : reaction flux ({})",
        "comment": "\t: Compound {} with initial condition {} had derivative {}, but uses conservation law.",
        "state": "\t{} ({}) : state variable ({})",
        "ode": "\t{}' = {} : affects compound ({})",
        "assignment": "\t{} = {} : assignment for expression ({})",
        "ion": "\tUSEION {} {} {} VALENCE {:d}",
    }

    safe_suffix_name = H[:25] if len(H) > 25 else H

    mod["TITLE"] = [f"TITLE {H}"]
    mod["COMMENT"] = [f"COMMENT\n\tautomatically generated from separate SBtab TSV files\n\tdate: {datetime.now().strftime('%c')}\nENDCOMMENT"]

    range_lines = []
    range_lines.extend(one_or_more_lines("\tRANGE", input_df, ": input", name_map))
    range_lines.extend(one_or_more_lines("\tRANGE", expression, ": assigned", name_map))
    range_lines.extend(one_or_more_lines("\tRANGE", compound, ": compound", name_map))

    ion_variables = set()
    ion_lines = []
    explicit_ion_writebacks = []

    if "USEION" in compound.columns:
        ion_mask = compound["USEION"].astype(str).str.strip().str.len() > 0
        compound_ion = compound[ion_mask]
        for idx, row in compound_ion.iterrows():
            val = int(row["VALENCE"]) if "VALENCE" in row and pd.notna(row["VALENCE"]) else 1
            r_var = str(row.get("READ", "")).strip() if pd.notna(row.get("READ")) else ""
            w_var = str(row.get("WRITE", "")).strip() if pd.notna(row.get("WRITE")) else ""
            
            if r_var and r_var.lower() != "none": ion_variables.add(tr(r_var))
            if w_var and w_var.lower() != "none": 
                ion_variables.add(tr(w_var))
                explicit_ion_writebacks.append((tr(w_var), tr(idx)))
            
            r_str = f"READ {tr(r_var)}" if r_var and r_var.lower() != "none" else ""
            w_str = f"WRITE {tr(w_var)}" if w_var and w_var.lower() != "none" else ""
            ion_lines.append(fmt["ion"].format(row.get("USEION", ""), r_str, w_str, val))

    for orig_ion_name, ion_info in ions_config.items():
        r_var = ion_info.get("read", "").strip()
        w_var = ion_info.get("write", "").strip()
        valence = ion_info.get("valence", 0)
        
        if r_var: ion_variables.add(tr(r_var))
        if w_var: 
            ion_variables.add(tr(w_var))
            matched_compound = None
            for c_idx in compound.index:
                if str(c_idx) == orig_ion_name:
                    matched_compound = c_idx
                    break
            if matched_compound:
                explicit_ion_writebacks.append((tr(w_var), tr(matched_compound)))
            else:
                explicit_ion_writebacks.append((tr(w_var), tr(orig_ion_name)))
        
        r_str = f"READ {tr(r_var)}" if r_var else ""
        w_str = f"WRITE {tr(w_var)}" if w_var else ""
        ion_lines.append(fmt["ion"].format(orig_ion_name, r_str, w_str, valence))

    pointer_neuron_lines = []
    pointer_assignments = []
    pointer_assigned_declarations = []
    pointer_compounds = set()

    for orig_name, p_info in pointers_config.items():
        p_name = tr(p_info.get("pointer_name"))
        p_unit = p_info.get("unit", "millimole/liter")
        pointer_neuron_lines.append(f"\tPOINTER {p_name}")
        pointer_assigned_declarations.append(f"\t{p_name} ({neuron_unit(p_unit)})")
        pointer_assigned_declarations.append(f"\t{tr(orig_name + '_rate')} ({neuron_unit(p_unit)}/ms)")
        
        if orig_name in compound.index:
            pointer_compounds.add(orig_name)
            pointer_assignments.append(f"\t{tr(orig_name)} = {p_name} : driven directly via RxD node tracking")

    mod["NEURON"] = [f"NEURON {{", f"\tSUFFIX {safe_suffix_name}"] + range_lines + ion_lines + pointer_neuron_lines + ["}"]

    known_symbols = set(list(compound.index))
    if constant is not None: known_symbols.update(list(constant.index))
    if expression is not None: known_symbols.update(list(expression.index))
    if input_df is not None: known_symbols.update(list(input_df.index))

    for orig_name, p_info in pointers_config.items():
        known_symbols.add(p_info.get("pointer_name"))
        known_symbols.add(f"{orig_name}_rate")

    conservation_law, conservation_input, c_name_law, n_laws = [], [], [], 0
    if con_law is not None and not con_law.empty:
        n_laws = len(con_law)
        for _, row_cl in con_law.iterrows():
            c_name = compound.index[int(row_cl["Eliminates"]) - 1]
            if c_name in pointer_compounds: continue 
            c_name_law.append(c_name)
            conservation_input.append(fmt["total"].format(tr(row_cl["ConstantName"]), row_cl["Constant"], row_cl["ConstantName"]))
            known_symbols.add(str(row_cl["ConstantName"]))
            
            formula_part = f" - ({row_cl['Formula']})" if row_cl['Formula'] != "0" else ""
            trans_formula = formula_part
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                trans_formula = re.sub(rf"\b{re.escape(k_id)}\b", v_id, trans_formula)
                
            trans_formula = wrap_expression(trans_formula, max_len=100, indent="\t\t")
            conservation_law.append(fmt["ConservationLaw"].format(tr(c_name), f"{tr(row_cl['ConstantName'])}{trans_formula}", c_name))

    constant_lines = ["CONSTANT {"]
    if constant is not None and not constant.empty:
        for idx, row in constant.iterrows():
            v_scaled, u_name = process_unit_and_value(float(row["Value"]), str(row.get("Unit", "")))
            constant_lines.append(fmt["const"].format(tr(idx), v_scaled, u_name, idx))
    constant_lines.append("}")
    mod["CONSTANT"] = constant_lines

    parameter_lines = ["PARAMETER {"]
    added_parameters = set()

    if parameter is not None and not parameter.empty:
        for idx, row in parameter.iterrows():
            p_name = str(idx)
            r_of_k = "a kinetic parameter"
            v_scaled, u_name = process_unit_and_value(float(row["Value"]), str(row.get("Unit", "")))
            parameter_lines.append(fmt["par"].format(tr(p_name), v_scaled, u_name, r_of_k, p_name))
            added_parameters.add(p_name)
            known_symbols.add(p_name)

    if reaction is not None and not reaction.empty:
        for _, r_row in reaction.iterrows():
            flux_str = str(r_row["Flux"])
            implicit_rates = re.findall(r"\b(k[fr]_\w+)\b", flux_str)
            for rate in implicit_rates:
                if rate not in added_parameters:
                    parameter_lines.append(f"\t{tr(rate)} = 1.0 (1) : implicitly declared missing rate constant ({rate})")
                    added_parameters.add(rate)
                    known_symbols.add(rate)

    if input_df is not None and not input_df.empty:
        for idx, row in input_df.iterrows():
            v_scaled, u_name = process_unit_and_value(float(row["DefaultValue"]), str(row.get("Unit", "")))
            parameter_lines.append(fmt["input"].format(tr(idx), v_scaled, u_name, idx))
            known_symbols.add(str(idx))
    parameter_lines.extend(conservation_input)
    parameter_lines.append("}")
    mod["PARAMETER"] = parameter_lines

    rogue_assigned = set()
    if reaction is not None and not reaction.empty:
        for idx, r_row in reaction.iterrows():
            known_symbols.add(str(idx))
            flux_str = str(r_row["Flux"])
            tokens = re.findall(r"\b([a-zA-Z_]\w*)\b", flux_str)
            for token in tokens:
                if token.lower() in ["exp", "log", "log10", "sin", "cos", "tan", "t", "time", "inf"]: continue
                if token not in known_symbols and token not in added_parameters: rogue_assigned.add(token)

    if expression is not None and not expression.empty:
        for idx, e_row in expression.iterrows():
            known_symbols.add(str(idx))
            formula_str = str(e_row["Formula"])
            tokens = re.findall(r"\b([a-zA-Z_]\w*)\b", formula_str)
            for token in tokens:
                if token.lower() in ["exp", "log", "log10", "sin", "cos", "tan", "t", "time", "inf"]: continue
                if token not in known_symbols and token not in added_parameters: rogue_assigned.add(token)

    assigned_lines = ["ASSIGNED {", "\ttime (ms) : alias for t"]
    if expression is not None and not expression.empty:
        for idx in expression.index: assigned_lines.append(fmt["expression"].format(tr(idx), idx))
    if reaction is not None and not reaction.empty:
        for idx in reaction.index: assigned_lines.append(fmt["flux"].format(tr(idx), idx))
    for name in c_name_law: assigned_lines.append(f"\t{tr(name)} : computed from conservation law ({name})")
    
    for c_name in sorted(list(pointer_compounds)):
        assigned_lines.append(f"\t{tr(c_name)} : variable assigned externally via pointer mapping ({c_name})")
    assigned_lines.extend(pointer_assigned_declarations)

    for ion_var in sorted(list(ion_variables)):
        assigned_lines.append(f"\t{ion_var} (mol/L) : ion variable registered for internal scope linkage")

    for rogue in sorted(list(rogue_assigned)):
        assigned_lines.append(f"\t{tr(rogue)} : catch-all baseline fallback tracking structural bounds ({rogue})")
    assigned_lines.append("}")
    mod["ASSIGNED"] = assigned_lines

    state_block, derivative_block, ivp_block = [], [], []
    eliminates_list = [int(x) for x in con_law["Eliminates"]] if n_laws > 0 else []

    has_active_odes = False
    for i in range(1, len(compound) + 1):
        idx_0 = i - 1
        c_name = compound.index[idx_0]
        row_comp = compound.iloc[idx_0]
        ode_expr = ode[idx_0] if idx_0 < len(ode) else ""

        if c_name in pointer_compounds:
            clean_ode = re.sub(r"^\s*\+", "", str(ode_expr))
            if not clean_ode or clean_ode.isspace(): clean_ode = "0"
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                clean_ode = re.sub(rf"\b{re.escape(k_id)}\b", v_id, clean_ode)
            
            pointer_assignments.append(f"\t{tr(c_name + '_rate')} = {wrap_expression(clean_ode, max_len=100, indent='\t\t')} : writeback consumption rate matrix element")
            continue

        if n_laws > 0 and i in eliminates_list:
            state_block.append(f"\t: {tr(c_name)} is calculated via Conservation Law")
            trans_ode = ode_expr
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                trans_ode = re.sub(rf"\b{re.escape(k_id)}\b", v_id, trans_ode)
            derivative_block.append(fmt["comment"].format(tr(c_name), row_comp.get("InitialValue", "0"), wrap_expression(trans_ode, max_len=100, indent="\t\t: ")))
            ivp_block.append(f"\t: {tr(c_name)} cannot have initial values as it is determined by conservation law")
        else:
            has_active_odes = True
            state_block.append(fmt["state"].format(tr(c_name), neuron_unit(str(row_comp.get("Unit", ""))), c_name))
            trans_ode = re.sub(r"^\s*\+", "", str(ode_expr))
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                trans_ode = re.sub(rf"\b{re.escape(k_id)}\b", v_id, trans_ode)
            derivative_block.append(fmt["ode"].format(tr(c_name), wrap_expression(trans_ode, max_len=100, indent="\t\t"), c_name))
            ivp_block.append(f"\t {tr(c_name)} = {row_comp.get('InitialValue', '0')} : initial condition")

    expression_lines = ["PROCEDURE assign_calculated_values() {", "\ttime = t : an alias for the time variable, if needed."]
    expression_lines.extend(conservation_law)
    expression_lines.extend(pointer_assignments)
    
    if explicit_ion_writebacks:
        expression_lines.append("\t: Ion WRITE variable value updates")
        for ion_w_var, source_var in explicit_ion_writebacks:
            expression_lines.append(f"\t{ion_w_var} = {source_var}")

    if expression is not None and not expression.empty:
        for idx, row in expression.iterrows(): 
            trans_form = row["Formula"]
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                trans_form = re.sub(rf"\b{re.escape(k_id)}\b", v_id, trans_form)
            expression_lines.append(fmt["assignment"].format(tr(idx), wrap_expression(trans_form, max_len=100, indent="\t\t"), idx))
            
    if reaction is not None and not reaction.empty:
        for idx, row in reaction.iterrows(): 
            trans_flux = row["Flux"]
            for k_id, v_id in sorted(name_map.items(), key=lambda x: len(x[0]), reverse=True):
                trans_flux = re.sub(rf"\b{re.escape(k_id)}\b", v_id, trans_flux)
            expression_lines.append(f"\t{tr(idx)} = {wrap_expression(trans_flux, max_len=100, indent="\t\t")} : flux expression {idx}")
    expression_lines.append("}")

    mod["EXPRESSION"] = expression_lines
    mod["STATE"] = ["STATE {"] + state_block + ["}"]
    mod["INITIAL"] = ["INITIAL {"] + ivp_block + ["}"]
    
    if has_active_odes:
        mod["BREAKPOINT"] = ["BREAKPOINT {", "\tSOLVE ode METHOD cnexp", "\tassign_calculated_values() : procedure", "}"]
        mod["DERIVATIVE"] = ["DERIVATIVE ode {"] + derivative_block + ["}"]
    else:
        mod["BREAKPOINT"] = ["BREAKPOINT {", "\tassign_calculated_values() : completely algebraic system loop", "}"]

    return mod


def convert_to_string(mod_dict: dict) -> str:
    blocks = ["TITLE", "COMMENT", "NEURON", "CONSTANT", "PARAMETER", "ASSIGNED", "STATE", "INITIAL", "BREAKPOINT", "DERIVATIVE", "EXPRESSION"]
    return "\n\n".join(["\n".join(mod_dict[b]) for b in blocks if b in mod_dict])


# ==========================================
# 5. PIPELINE EXECUTION ENTRY
# ==========================================
def main():
    parser = argparse.ArgumentParser(description="Convert a folder of standalone SBtab TSV files into a unified NEURON MOD file.")
    parser.add_argument("model_folder", type=str, help="Path to the directory containing the separate *.tsv model files")
    parser.add_argument("-o", "--output", type=str, default=None, help="Name of output MOD file (defaults to folder_name.mod)")
    parser.add_argument("-n", "--name", type=str, default=None, help="Mechanism SUFFIX name inside the MOD block (defaults to folder name)")
    parser.add_argument("-c", "--config", type=str, default=None, help="Path to JSON configuration file for NEURON tracking (pointers/ions)")
    parser.add_argument("--no-cla", action="store_true", help="Disable linear Conservation Law algebraic state reductions")
    
    args = parser.parse_args()
    
    folder_path = os.path.abspath(args.model_folder)
    folder_name = os.path.basename(os.path.normpath(folder_path))
    
    model_name = args.name if args.name else folder_name
    output_filename = args.output if args.output else f"{model_name}.mod"
    output_path = os.path.join(os.getcwd(), output_filename)

    neuron_config = {}
    protected_names = set()
    if args.config and os.path.exists(args.config):
        print(f"[*] Loading NEURON external mapping config: {args.config}")
        with open(args.config, "r", encoding="utf-8") as jf:
            neuron_config = json.load(jf)
        
        for key in neuron_config.get("pointers", {}).keys():
            protected_names.add(key)
        for val in neuron_config.get("pointers", {}).values():
            protected_names.add(val.get("pointer_name"))
        for key in neuron_config.get("ions", {}).keys():
            protected_names.add(key)
        for val in neuron_config.get("ions", {}).values():
            if val.get("write"): protected_names.add(val.get("write"))
            if val.get("read"): protected_names.add(val.get("read"))

    print(f"[*] Analyzing folder contents: {folder_path}")
    raw_sbtab = parse_sbtab_folder(folder_path)

    reaction = get_reactions(raw_sbtab)
    constant = get_constants(raw_sbtab)
    expression = get_expressions(raw_sbtab)
    compound = get_compounds(raw_sbtab)
    parameter = get_parameters(raw_sbtab)
    input_df = get_inputs(raw_sbtab)

    cleaned_compound_indices = []
    for idx in compound.index:
        name_str = str(idx)
        if name_str in protected_names:
            cleaned_compound_indices.append(name_str)
        else:
            if re.match(r"^\d", name_str):
                name_str = f"comp_{name_str}"
            cleaned_compound_indices.append(name_str)
    
    compound_rename_map = dict(zip(compound.index, cleaned_compound_indices))
    compound.index = cleaned_compound_indices
    
    if reaction is not None and not reaction.empty:
        for old_id, new_id in sorted(compound_rename_map.items(), key=lambda x: len(str(x[0])), reverse=True):
            if old_id == new_id: continue
            pattern = rf"\b{re.escape(str(old_id))}\b"
            reaction["Flux"] = reaction["Flux"].apply(lambda x: re.sub(pattern, new_id, str(x)))
            reaction["Formula"] = reaction["Formula"].apply(lambda x: re.sub(pattern, new_id, str(x)))

    if expression is not None and not expression.empty:
        for old_id, new_id in sorted(compound_rename_map.items(), key=lambda x: len(str(x[0])), reverse=True):
            if old_id == new_id: continue
            pattern = rf"\b{re.escape(str(old_id))}\b"
            expression["Formula"] = expression["Formula"].apply(lambda x: re.sub(pattern, new_id, str(x)))

    if "IsConstant" in compound.columns and compound["IsConstant"].any():
        cc = compound[compound["IsConstant"]]
        new_expr = pd.DataFrame({"Formula": cc["InitialValue"], "Unit": cc["Unit"]}, index=cc.index)
        expression = pd.concat([expression, new_expr]) if expression is not None else new_expr
        compound = compound[~compound["IsConstant"]]

    print("[*] Formulating network matrix coordinates...")
    model_structure = parse_reaction_formulae(compound, reaction, expression, input_df)
    ode_list = model_structure["ODE"]
    stoichiometry_matrix = model_structure["Stoichiometry"]

    con_law_df = None
    if not args.no_cla:
        print("[*] Computing conservation dependencies...")
        laws = get_conservation_laws(stoichiometry_matrix)
        if laws is not None:
            print(f"    Found {laws.shape[1]} linear constraints.")
            ivs = pd.to_numeric(compound["InitialValue"], errors="coerce").fillna(0.0).tolist()
            con_law_df = get_law_text(laws, list(compound.index), ivs)

    name_translations = {}
    
    def register_safe_name(long_name, class_prefix):
        if long_name in protected_names:
            return long_name
        if len(long_name) <= 28: 
            return long_name
        if long_name not in name_translations:
            idx = len([v for v in name_translations.values() if v.startswith(class_prefix)]) + 1
            name_translations[long_name] = f"{class_prefix}_{idx}"
        return name_translations[long_name]

    for c_id in compound.index: register_safe_name(str(c_id), "C")
    if constant is not None:
        for cst_id in constant.index: register_safe_name(str(cst_id), "K")
    if parameter is not None:
        for p_id in parameter.index: register_safe_name(str(p_id), "P")
    if expression is not None:
        for e_id in expression.index: register_safe_name(str(e_id), "E")
    if reaction is not None:
        for r_id in reaction.index: register_safe_name(str(r_id), "R")
    if input_df is not None:
        for i_id in input_df.index: register_safe_name(str(i_id), "IN")
    if con_law_df is not None:
        for cl_idx, cl_row in con_law_df.iterrows():
            register_safe_name(str(cl_row["ConstantName"]), "CONS")
            
    for orig_name in neuron_config.get("pointers", {}).keys():
        register_safe_name(f"{orig_name}_rate", "PR")

    if reaction is not None and not reaction.empty:
        for _, r_row in reaction.iterrows():
            flux_str = str(r_row["Flux"])
            implicit_rates = re.findall(r"\b(k[fr]_\w+)\b", flux_str)
            for rate in implicit_rates:
                register_safe_name(rate, "P")

    print(f"[*] Shortened {len(name_translations)} exceptionally long variables to satisfy NMODL string rules.")

    print("[*] Structuring block files...")
    mod_blocks = make_mod(
        H=model_name,
        constant=constant,
        parameter=parameter,
        input_df=input_df,
        expression=expression,
        reaction=reaction,
        compound=compound,
        ode=ode_list,
        name_map=name_translations,
        con_law=con_law_df,
        config=neuron_config,
    )

    final_mod_text = convert_to_string(mod_blocks)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(final_mod_text)
        
    print(f"[+] Output successfully built in your local workspace: {output_path}")


if __name__ == "__main__":
    main()
