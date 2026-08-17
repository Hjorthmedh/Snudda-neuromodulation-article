"""RxD vs .mod (euler) vs .mod (derivimplicit) at the distal dendrite.

Reads dend[47], sec_x=0.95:
  - RxD species (cascade compounds, "cal", "DA"): spatial node 48
    (= dend[47]; soma=0, dend[i]=i+1)
  - density-mechanism recordings: row 1 (entry index for sec_id=47)
  - membrane.cali (caldyn_ms STATE): row 1 (entry index for sec_id=47)

For cal we plot BOTH locations:
  * "cal"           — RxD species (cal Parameter, also the RxD node value)
  * "cali"          — caldyn_ms STATE seen by the cascade .mod (Ca = cali)
If they disagree within one run, the cal ion has a write conflict
between RxD's species sync and caldyn_ms's WRITE cali.

RxD = solid blue; mod euler = dashed orange; mod derivimplicit = dotted green.
"""
import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from snudda.utils import SnuddaLoadSimulation

SPECIES = [
    "DA", "cal", "cali",                         # cali = caldyn_ms STATE; cal = RxD species
    "D1R_Golf_DA", "GaolfGTP",
    "AC5_Ca_GaolfGTP", "cAMP", "PKAc",
    "PKAc_D32", "D32p34", "PP1_pSubstrate",
    "pSubstrate", "CaMKII", "pCaMKII",
    # downstream / functional readouts
    "voltage_soma", "voltage_distal", "sk_modulation_soma", "naf_modulation_soma",
]
DISTAL_NODE = 48      # RxD node index for dend[47]
DISTAL_ROW  = 1       # mod recording row 1 (entry index for sec_id=47)
SOMA_ROW    = 0       # mod recording row 0 / rxd node 0 / col 0 (soma)


def _pick(arr, idx):
    """arr is (n_time, n_cols) or (n_time,). Return column idx."""
    return arr[:, idx] if arr.ndim == 2 else arr


def trace(path, species, suffix=None):
    """Read every species at the distal location (or soma for *_soma keys).

    suffix is None for the RxD run (cascade species live as bare RxD names),
    else the .mod SUFFIX for the cascade ("Nair_2016_optimized",
    "Nair_2016_optimized_di", "Nair_2016_optimized_ptr", ...).
    """
    nd = SnuddaLoadSimulation(path)
    t = np.asarray(nd.get_time())
    out = {}
    for s in species:
        try:
            if s == "voltage_soma":
                # record_all_soma path: one column per neuron
                a = np.asarray(nd.get_data("voltage", 0)[0][0])
                out[s] = _pick(a, 0)
            elif s == "voltage_distal":
                # record_membrane v entries: row 0=soma, row 1=distal
                a = np.asarray(nd.get_data("membrane.v", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
            elif s == "sk_modulation_soma":
                a = np.asarray(nd.get_data("sk_ms.modulation_factor", 0)[0][0])
                out[s] = _pick(a, SOMA_ROW)
            elif s == "naf_modulation_soma":
                a = np.asarray(nd.get_data("naf_ms.modulation_factor", 0)[0][0])
                out[s] = _pick(a, SOMA_ROW)
            elif s == "cali":
                # caldyn_ms STATE, recorded via record_membrane
                a = np.asarray(nd.get_data("membrane.cali", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
            elif s in ("cal", "DA") or suffix is None:
                # RxD species: full spatial trace, pick distal node
                a = np.asarray(nd.get_data(s, 0)[0][0])
                out[s] = _pick(a, DISTAL_NODE)
            else:
                # cascade compound from the .mod recording
                a = np.asarray(nd.get_data(f"{suffix}.{s}", 0)[0][0])
                out[s] = _pick(a, DISTAL_ROW)
        except Exception:
            out[s] = None
    return t, out


t_rxd,  rxd  = trace("networks/rxd/simulation/output.hdf5",     SPECIES, suffix=None)
t_mod,  mod  = trace("networks/mod/simulation/output.hdf5",     SPECIES, suffix="Nair_2016_optimized")
t_modi, modi = trace("networks/mod_di/simulation/output.hdf5",  SPECIES, suffix="Nair_2016_optimized_di")
t_modp, modp = trace("networks/mod_ptr/simulation/output.hdf5", SPECIES, suffix="Nair_2016_optimized_ptr")

n = len(SPECIES)
cols = 3
rows = (n + cols - 1) // cols
fig = make_subplots(
    rows=rows, cols=cols, subplot_titles=SPECIES,
    horizontal_spacing=0.06, vertical_spacing=0.08,
)

STYLES = [
    ("RxD",                 t_rxd,  rxd,  dict(color="#1f77b4", width=2)),
    ("mod (euler)",         t_mod,  mod,  dict(color="#ff7f0e", width=2, dash="dash")),
    ("mod (derivimplicit)", t_modi, modi, dict(color="#2ca02c", width=2, dash="dot")),
    ("mod (ptr writeback)", t_modp, modp, dict(color="#d62728", width=2, dash="dashdot")),
]

for i, s in enumerate(SPECIES):
    r, c = i // cols + 1, i % cols + 1
    for name, t, data, line in STYLES:
        if data.get(s) is not None:
            fig.add_trace(
                go.Scatter(x=t, y=data[s], mode="lines", name=name,
                           line=line, showlegend=(i == 0)),
                row=r, col=c,
            )
    fig.update_xaxes(title_text="t (s)", row=r, col=c)
    # y-axis label by species type
    if s in ("voltage_soma", "voltage_distal"):
        yt = "mV"
    elif s.endswith("modulation_soma"):
        yt = "factor"
    else:
        yt = "mM"
    fig.update_yaxes(title_text=yt, row=r, col=c)

fig.update_layout(height=300 * rows, width=350 * cols,
                  title="RxD vs Nair .mod (euler / derivimplicit / ptr) - distal dendrite (dend[47] tip, ~203 um). "
                        "Last row: soma readouts (voltage and sk/naf modulation factor).",
                  template="plotly_white")
fig.write_html("compare_rxd_vs_mod_distal.html")
fig.write_image("compare_rxd_vs_mod_distal.png", scale=2)
print("Wrote compare_rxd_vs_mod_distal.{html,png}")
