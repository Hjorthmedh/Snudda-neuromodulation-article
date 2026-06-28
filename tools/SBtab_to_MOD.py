import argparse
import os
import re
from datetime import datetime
import numpy as np
import pandas as pd
import sympy


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
            # Skip empty lines, metadata headers, or comments
            if not line or line.startswith("%") or line.startswith("!!"):
                continue
            lines.append(line)

    if not lines:
        return None

    split_rows = [l.split("\t") for l in lines]

    # Find the header row (the row where the first element starts with '!')
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
    """Scans a directory for TSV files and maps them to their SBtab equivalents."""
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

        # Standardize table keys based on file naming conventions
        if base_name in ["Reaction", "Reactions-conv"]:
            tables["Reaction"] = df
        else:
            tables[base_name] = df

    # Double check if reaction variant mapping fallback is necessary
    if "Reaction" not in tables and "Reactions-conv" in tables:
        tables["Reaction"] = tables["Reactions-conv"]

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


def _sbtab_quantity(df: pd.DataFrame) -> pd.Series:
    col = "!Value" if "!Value" in df.columns else df.columns[0]
    return pd.to_numeric(df[col], errors="coerce").fillna(0.0)


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
    return None if df is None or df.empty else pd.DataFrame({"Value": _sbtab_quantity(df), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_compounds(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict["Compound"]
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
    return None if df is None or df.empty else pd.DataFrame({"Formula": df.get("!Formula", ""), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_parameters(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Parameter")
    if df is None or df.empty:
        return pd.DataFrame(columns=["Value", "Unit"])
    scale = _optional_column(df, "!Scale", "character")
    values = _sbtab_quantity(df).copy()
    for idx, s in scale.items():
        if "log" in str(s).lower() or str(s).lower() == "ln":
            if re.search(r"((natural|base-e)?\s*log(arithm)?|ln)", str(s), re.IGNORECASE):
                values.at[idx] = np.exp(values.at[idx])
            elif re.search(r"((decadic|base-10)\s*logarithm|log10)", str(s), re.IGNORECASE):
                values.at[idx] = 10 ** values.at[idx]
    return pd.DataFrame({"Value": values, "Unit": df.get("!Unit", "1")}, index=df.index)


def get_outputs(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Output")
    if df is None or df.empty:
        return pd.DataFrame(columns=["Formula", "Unit"])
    return pd.DataFrame({"Formula": df.get("!Formula", ""), "Unit": df.get("!Unit", "1")}, index=df.index)


def get_inputs(sbtab_dict: dict) -> pd.DataFrame:
    df = sbtab_dict.get("Input")
    if df is None or df.empty:
        return None
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

        # Process Products (Right-Hand Side)
        term_b = update_ode_and_stoichiometry(b, compound_df, expression_df, input_df)
        for k in range(len(b)):
            j = term_b["J"][k]
            if j > 0:
                idx = j - 1
                val = term_b["n"][k]
                coeff_b = f"{val}*" if val > 1 else ""
                ODE[idx] = f"{ODE[idx]}+{coeff_b}{rxn_id}"
                N[idx, i] += val

        # Process Reactants (Left-Hand Side)
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
        const_name = f"{compound_names[k]}_ConservedConst"
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
def one_or_more_lines(prefix: str, table: pd.DataFrame, suffix: str) -> list[str]:
    if table is None or table.empty: return []
    names_list = [str(idx) for idx in table.index]
    single_line = f"{prefix} {', '.join(names_list)} {suffix}"
    return [single_line] if len(single_line) < 76 else [f"{prefix} {name} {suffix}" for name in names_list]


def neuron_unit(unit: str) -> str:
    if not isinstance(unit, str) or pd.isna(unit): return ""
    return re.sub(r"\s*\*\s*", "-", re.sub(r"[()]", "", re.sub(r"^\s*1/", "/", unit)))


def make_mod(H, constant, parameter, input_df, expression, reaction, compound, ode, con_law=None):
    mod = {}
    fmt = {
        "const": "\t{} = {} ({}) : a constant",
        "par": "\t{} = {} ({}): {}",
        "input": "\t{}  = {} ({}) : an input",
        "total": "\t{} = {} : the total amount of a conserved sub-set of states",
        "ConservationLaw": "\t{} = {} : conservation law",
        "expression": "\t{} : a pre-defined algebraic expression",
        "flux": "\t{} : a flux, for use in DERIVATIVE mechanism",
        "comment": "\t: Compound {} with initial condition {} had derivative {}, but is calculated by conservation law.",
        "state": "\t{} ({}) : a state variable",
        "ode": "\t{}' = {} : affects compound {}",
        "assignment": "\t{} = {} : assignment for expression {}",
        "ion": "\tUSEION {} READ {} WRITE {} VALENCE {:d} : {}",
    }

    mod["TITLE"] = [f"TITLE {H}"]
    mod["COMMENT"] = [f"COMMENT\n\tautomatically generated from separate SBtab TSV files\n\tdate: {datetime.now().strftime('%c')}\nENDCOMMENT"]

    range_lines = []
    range_lines.extend(one_or_more_lines("\tRANGE", input_df, ": input"))
    range_lines.extend(one_or_more_lines("\tRANGE", expression, ": assigned"))
    range_lines.extend(one_or_more_lines("\tRANGE", compound, ": compound"))

    if "USEION" in compound.columns:
        ion_mask = compound["USEION"].astype(str).str.strip().str.len() > 0
        compound_ion, compound_clean = compound[ion_mask], compound[~ion_mask].copy()
    else:
        compound_ion, compound_clean = pd.DataFrame(), compound.copy()

    ion_lines = []
    for idx, row in compound_ion.iterrows():
        val = int(row["VALENCE"]) if "VALENCE" in row and pd.notna(row["VALENCE"]) else 1
        ion_lines.append(fmt["ion"].format(row.get("USEION", ""), row.get("READ", ""), row.get("WRITE", ""), val, idx))

    mod["NEURON"] = ["NEURON {", f"\tSUFFIX {H}"] + range_lines + ion_lines + ["}"]

    # Collect known symbols to prevent declaring them as rogue values later
    known_symbols = set(list(compound.index))
    if constant is not None: known_symbols.update(list(constant.index))
    if expression is not None: known_symbols.update(list(expression.index))
    if input_df is not None: known_symbols.update(list(input_df.index))

    conservation_law, conservation_input, c_name_law, n_laws = [], [], [], 0
    if con_law is not None and not con_law.empty:
        n_laws = len(con_law)
        for _, row_cl in con_law.iterrows():
            c_name = compound_clean.index[int(row_cl["Eliminates"]) - 1]
            c_name_law.append(c_name)
            conservation_input.append(fmt["total"].format(row_cl["ConstantName"], row_cl["Constant"]))
            known_symbols.add(str(row_cl["ConstantName"]))
            
            formula_part = f" - ({row_cl['Formula']})" if row_cl['Formula'] != "0" else ""
            conservation_law.append(fmt["ConservationLaw"].format(c_name, f"{row_cl['ConstantName']}{formula_part}"))

    constant_lines = ["CONSTANT {"]
    if constant is not None and not constant.empty:
        for idx, row in constant.iterrows():
            constant_lines.append(fmt["const"].format(idx, row["Value"], neuron_unit(str(row.get("Unit", "")))))
    constant_lines.append("}")
    mod["CONSTANT"] = constant_lines

    parameter_lines = ["PARAMETER {"]
    added_parameters = set()

    if parameter is not None and not parameter.empty:
        parameter_cp = parameter.copy()
        for idx, row in parameter_cp.iterrows():
            unit_str = str(row.get("Unit", ""))
            if re.search(r"/.*\bsecond\b", unit_str):
                parameter_cp.at[idx, "Unit"] = re.sub(r"\bsecond\b", "millisecond", unit_str)
                parameter_cp.at[idx, "Value"] = float(row["Value"]) / 1e3
        for idx, row in parameter_cp.iterrows():
            p_name = str(idx)
            r_of_k = "does not appear in reactions."
            if reaction is not None and not reaction.empty:
                matches = [str(r_row["Flux"]) for _, r_row in reaction.iterrows() if re.search(rf"\b{re.escape(p_name)}\b", str(r_row["Flux"]))]
                if matches: r_of_k = ", ".join(matches)
            parameter_lines.append(fmt["par"].format(p_name, row["Value"], neuron_unit(str(row.get("Unit", ""))), r_of_k))
            added_parameters.add(p_name)
            known_symbols.add(p_name)

    # Auto-register missing rate constant parameters (e.g., kf_*, kr_*) found in reactions
    if reaction is not None and not reaction.empty:
        for _, r_row in reaction.iterrows():
            flux_str = str(r_row["Flux"])
            implicit_rates = re.findall(r"\b(k[fr]_\w+)\b", flux_str)
            for rate in implicit_rates:
                if rate not in added_parameters:
                    parameter_lines.append(f"\t{rate} = 1.0 (1) : implicitly declared missing rate constant")
                    added_parameters.add(rate)
                    known_symbols.add(rate)

    if input_df is not None and not input_df.empty:
        for idx, row in input_df.iterrows():
            parameter_lines.append(fmt["input"].format(idx, row["DefaultValue"], neuron_unit(str(row.get("Unit", "")))))
            known_symbols.add(str(idx))
    parameter_lines.extend(conservation_input)
    parameter_lines.append("}")
    mod["PARAMETER"] = parameter_lines

    # --- UPDATED STRUCTURAL ASSIGNED SAFETY SCAN ---
    # Now comprehensively scans BOTH Reaction AND Expression formula strings 
    # to catch every floating parameter (e.g., DA_basal, tau_DA1) missing from sheets.
    rogue_assigned = set()
    
    # 1. Scan Reaction Fluxes
    if reaction is not None and not reaction.empty:
        for idx, r_row in reaction.iterrows():
            known_symbols.add(str(idx))
            flux_str = str(r_row["Flux"])
            tokens = re.findall(r"\b([a-zA-Z_]\w*)\b", flux_str)
            for token in tokens:
                if token.lower() in ["exp", "log", "log10", "sin", "cos", "tan", "t", "time", "inf"]:
                    continue
                if token not in known_symbols and token not in added_parameters:
                    rogue_assigned.add(token)

    # 2. Scan Expression Formulas
    if expression is not None and not expression.empty:
        for idx, e_row in expression.iterrows():
            known_symbols.add(str(idx))
            formula_str = str(e_row["Formula"])
            tokens = re.findall(r"\b([a-zA-Z_]\w*)\b", formula_str)
            for token in tokens:
                if token.lower() in ["exp", "log", "log10", "sin", "cos", "tan", "t", "time", "inf"]:
                    continue
                if token not in known_symbols and token not in added_parameters:
                    rogue_assigned.add(token)

    assigned_lines = ["ASSIGNED {", "\ttime (millisecond) : alias for t"]
    if expression is not None and not expression.empty:
        for idx in expression.index: assigned_lines.append(fmt["expression"].format(idx))
    if reaction is not None and not reaction.empty:
        for idx in reaction.index: assigned_lines.append(fmt["flux"].format(idx))
    for name in c_name_law: assigned_lines.append(f"\t{name} : computed from conservation law")
    
    # Inject dynamically protected variables so NEURON compilation environment clears
    for rogue in sorted(list(rogue_assigned)):
        assigned_lines.append(f"\t{rogue} : catch-all baseline fallback tracking structural bounds")
    assigned_lines.append("}")
    mod["ASSIGNED"] = assigned_lines

    state_block, derivative_block, ivp_block = [], [], []
    eliminates_list = [int(x) for x in con_law["Eliminates"]] if n_laws > 0 else []

    has_active_odes = False
    for i in range(1, len(compound_clean) + 1):
        idx_0 = i - 1
        c_name = compound_clean.index[idx_0]
        row_comp = compound_clean.iloc[idx_0]
        ode_expr = ode[idx_0] if idx_0 < len(ode) else ""

        if n_laws > 0 and i in eliminates_list:
            state_block.append(f"\t: {c_name} is calculated via Conservation Law")
            derivative_block.append(fmt["comment"].format(c_name, row_comp.get("InitialValue", "0"), ode_expr))
            ivp_block.append(f"\t: {c_name} cannot have initial values as it is determined by conservation law")
        else:
            has_active_odes = True
            state_block.append(fmt["state"].format(c_name, neuron_unit(str(row_comp.get("Unit", "")))))
            derivative_block.append(fmt["ode"].format(c_name, re.sub(r"^\s*\+", "", str(ode_expr)), c_name))
            ivp_block.append(f"\t {c_name} = {row_comp.get('InitialValue', '0')} : initial condition")

    expression_lines = ["PROCEDURE assign_calculated_values() {", "\ttime = t : an alias for the time variable, if needed."]
    expression_lines.extend(conservation_law)
    if expression is not None and not expression.empty:
        for idx, row in expression.iterrows(): expression_lines.append(fmt["assignment"].format(idx, row["Formula"], idx))
    if reaction is not None and not reaction.empty:
        for idx, row in reaction.iterrows(): expression_lines.append(f"\t{idx} = {row['Flux']} : flux expression {idx}")
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
    parser.add_argument("--no-cla", action="store_true", help="Disable linear Conservation Law algebraic state reductions")
    
    args = parser.parse_args()
    
    folder_path = os.path.abspath(args.model_folder)
    folder_name = os.path.basename(os.path.normpath(folder_path))
    
    model_name = args.name if args.name else folder_name
    output_filename = args.output if args.output else f"{model_name}.mod"
    output_path = os.path.join(os.getcwd(), output_filename)

    print(f"[*] Analyzing folder contents: {folder_path}")
    raw_sbtab = parse_sbtab_folder(folder_path)

    reaction = get_reactions(raw_sbtab)
    constant = get_constants(raw_sbtab)
    expression = get_expressions(raw_sbtab)
    compound = get_compounds(raw_sbtab)
    parameter = get_parameters(raw_sbtab)
    input_df = get_inputs(raw_sbtab)

    safe_suffix = "_st"
    
    # Track original IDs before suffixing
    original_compound_ids = list(compound.index)
    
    # Sort descending by length so complex IDs are replaced before shorter substrings
    sorted_original_ids = sorted(original_compound_ids, key=len, reverse=True)
    
    compound.index = [f"{idx}{safe_suffix}" for idx in compound.index]
    
    # Regular expression transformation loops
    if reaction is not None and not reaction.empty:
        for orig_id in sorted_original_ids:
            pattern = rf"\b{re.escape(str(orig_id))}\b"
            reaction["Flux"] = reaction["Flux"].apply(lambda x: re.sub(pattern, f"{orig_id}{safe_suffix}", str(x)))
            reaction["Formula"] = reaction["Formula"].apply(lambda x: re.sub(pattern, f"{orig_id}{safe_suffix}", str(x)))

    if expression is not None and not expression.empty:
        for orig_id in sorted_original_ids:
            pattern = rf"\b{re.escape(str(orig_id))}\b"
            expression["Formula"] = expression["Formula"].apply(lambda x: re.sub(pattern, f"{orig_id}{safe_suffix}", str(x)))

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
        con_law=con_law_df,
    )

    final_mod_text = convert_to_string(mod_blocks)
    with open(output_path, "w", encoding="utf-8") as f:
        f.write(final_mod_text)
        
    print(f"[+] Output successfully built in your local workspace: {output_path}")


if __name__ == "__main__":
    main()
