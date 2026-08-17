"""Numerical-error quantification, RxD vs .mod variants.

For each species at the distal dendrite (dend[47], sec_x=0.95), plot
|mod - RxD| on a log y-axis -- absolute deviation in the species' own
units (mM for chemistry, mV for voltage, dimensionless for modulation
factor). One trace per mod variant.

The terminal table prints peak |mod - RxD| per species so deviations
land in interpretable physical units rather than as a normalized ratio
that depends on the trace window.

Both timebases are sample_dt=1e-3 s; if mod and rxd runs have different
durations, the comparison is truncated to the shorter one.
"""

import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from snudda.utils import SnuddaLoadSimulation

SPECIES = [
    "DA",
    "cal",
    "cali",
    "D1R_Golf_DA",
    "GaolfGTP",
    "AC5_Ca_GaolfGTP",
    "cAMP",
    "PKAc",
    "PKAc_D32",
    "D32p34",
    "PP1_pSubstrate",
    "pSubstrate",
    "CaMKII",
    "pCaMKII",
    # functional readouts
    "voltage_soma",
    "voltage_distal",
    "sk_modulation_soma",
    "naf_modulation_soma",
]
DISTAL_NODE = 48
DISTAL_ROW = 1
SOMA_ROW = 0
# Per-species absolute fp-noise floor reference (one number; rough double-precision
# accumulation over ~1k steps). Plotted as grey dashed line; not unit-aware.
FP_FLOOR = 1e-14

UNITS = {
    "DA": "mM",
    "cal": "mM",
    "cali": "mM",
    "voltage_soma": "mV",
    "voltage_distal": "mV",
    "sk_modulation_soma": "(dimensionless)",
    "naf_modulation_soma": "(dimensionless)",
}
# Everything else defaults to mM (cascade chemistry).


def _pick(arr, idx):
    return arr[:, idx] if arr.ndim == 2 else arr


def trace(path, species, suffix=None):
    try:
        nd = SnuddaLoadSimulation(path)
        t = np.asarray(nd.get_time())
    except Exception as e:
        print(f"  [skip] {path}: {e}")
        return np.array([]), {s: None for s in species}
    out = {}
    for s in species:
        try:
            if s == "voltage_soma":
                a = np.asarray(nd.get_data("voltage", 0)[0][0])
                out[s] = _pick(a, 0)
            elif s == "voltage_distal":
                a = np.asarray(nd.get_data("membrane.v", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
            elif s == "sk_modulation_soma":
                a = np.asarray(nd.get_data("sk_ms.modulation_factor", 0)[0][0])
                out[s] = _pick(a, SOMA_ROW)
            elif s == "naf_modulation_soma":
                a = np.asarray(nd.get_data("naf_ms.modulation_factor", 0)[0][0])
                out[s] = _pick(a, SOMA_ROW)
            elif s == "cali":
                a = np.asarray(nd.get_data("membrane.cali", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
            elif s in ("cal", "DA") or suffix is None:
                a = np.asarray(nd.get_data(s, 0)[0][0])
                out[s] = _pick(a, DISTAL_NODE)
            else:
                a = np.asarray(nd.get_data(f"{suffix}.{s}", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
        except Exception:
            out[s] = None
    return t, out


t_rxd, rxd = trace("networks/rxd/simulation/output.hdf5", SPECIES, suffix=None)
t_mod, mod = trace(
    "networks/mod/simulation/output.hdf5", SPECIES, suffix="Nair_2016_optimized"
)
t_modi, modi = trace(
    "networks/mod_di/simulation/output.hdf5", SPECIES, suffix="Nair_2016_optimized_di"
)
t_modp, modp = trace(
    "networks/mod_ptr/simulation/output.hdf5", SPECIES, suffix="Nair_2016_optimized_ptr"
)


def abs_err(ref, other):
    """Absolute pointwise deviation |other - ref|, truncated to shorter trace."""
    if ref is None or other is None:
        return None
    n = min(len(ref), len(other))
    ref, other = np.asarray(ref[:n]), np.asarray(other[:n])
    return np.abs(other - ref)


n = len(SPECIES)
cols = 3
rows = (n + cols - 1) // cols
fig = make_subplots(
    rows=rows,
    cols=cols,
    subplot_titles=SPECIES,
    horizontal_spacing=0.06,
    vertical_spacing=0.08,
)

CASES = [
    ("|mod_euler − RxD| / max|RxD|", t_mod, mod, "#ff7f0e", "dash"),
    ("|mod_di    − RxD| / max|RxD|", t_modi, modi, "#2ca02c", "dot"),
    ("|mod_ptr   − RxD| / max|RxD|", t_modp, modp, "#d62728", "dashdot"),
]

t_min = float(np.asarray(t_rxd)[0])
t_max = float(np.asarray(t_rxd)[-1])

for i, s in enumerate(SPECIES):
    r, c = i // cols + 1, i % cols + 1
    # fp-noise reference line
    fig.add_trace(
        go.Scatter(
            x=[t_min, t_max],
            y=[FP_FLOOR, FP_FLOOR],
            mode="lines",
            name=f"{FP_FLOOR:.0e} (fp ref)",
            line=dict(color="#888", width=1, dash="longdash"),
            showlegend=(i == 0),
            hoverinfo="skip",
        ),
        row=r,
        col=c,
    )
    for name, t, data, color, dash in CASES:
        err = abs_err(rxd.get(s), data.get(s))
        if err is None:
            continue
        # log axis: drop zeros so they don't blow up the plot
        y = np.where(err > 0, err, np.nan)
        fig.add_trace(
            go.Scatter(
                x=t,
                y=y,
                mode="lines",
                name=name,
                line=dict(color=color, width=2, dash=dash),
                showlegend=(i == 0),
            ),
            row=r,
            col=c,
        )
    fig.update_xaxes(title_text="t (s)", row=r, col=c)
    fig.update_yaxes(title_text=f"|Δ| {UNITS.get(s, 'mM')}", type="log", row=r, col=c)

fig.update_layout(
    height=300 * rows,
    width=350 * cols,
    title="Absolute error vs RxD reference - distal dendrite (dend[47] tip). "
    "log y; |Δ| in each species' own units (mM / mV / dim'less).",
    template="plotly_white",
)
fig.write_html("error_rxd_vs_mod_distal.html")
fig.write_image("error_rxd_vs_mod_distal.png", scale=2)

# Also print a one-line summary so we get numbers in the terminal
print(
    f"{'species':<22} {'unit':<6} | {'euler':>11} | {'di':>11} | {'ptr':>11}   (peak |Δ| vs RxD)"
)
print("-" * 80)
for s in SPECIES:
    e_eu = abs_err(rxd.get(s), mod.get(s))
    e_di = abs_err(rxd.get(s), modi.get(s))
    e_pt = abs_err(rxd.get(s), modp.get(s))
    u = UNITS.get(s, "mM")
    a = f"{np.nanmax(e_eu):.3e}" if e_eu is not None else "      -    "
    b = f"{np.nanmax(e_di):.3e}" if e_di is not None else "      -    "
    c = f"{np.nanmax(e_pt):.3e}" if e_pt is not None else "      -    "
    print(f"{s:<22} {u:<6} | {a:>11} | {b:>11} | {c:>11}")

print()
print("Wrote error_rxd_vs_mod_distal.{html,png}")
