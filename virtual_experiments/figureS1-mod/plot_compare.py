"""Faceted RxD vs .mod comparison, one species per panel.

RxD = solid; mod = dashed overlay.

"""

import numpy as np
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from snudda.utils import SnuddaLoadSimulation

# Species to compare. Pick a representative subset of the cascade.
SPECIES = [
    "DA",
    "cal",
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
]


def trace(path, species, label):
    nd = SnuddaLoadSimulation(path)
    t = np.asarray(nd.get_time())
    out = {}
    for s in species:
        try:
            a = np.asarray(nd.get_data(s, 0)[0][0])
            # take soma compartment 0
            out[s] = a[:, 0] if a.ndim == 2 else a
        except Exception:
            out[s] = None
    return t, out


t_rxd, rxd = trace("networks/rxd/simulation/output.hdf5", SPECIES, "RxD")


# In mod output, RxD-species names appear as 'Nair_2016_optimized.<name>'
def trace_mod(path, species):
    nd = SnuddaLoadSimulation(path)
    t = np.asarray(nd.get_time())
    out = {}
    for s in species:
        try:
            # cal lives in the membrane.cali recording (from caldyn_ms via record_membrane)
            key = "membrane.cali" if s == "cal" else f"Nair_2016_optimized.{s}"
            a = np.asarray(nd.get_data(key, 0)[0][0])
            out[s] = a[:, 0] if a.ndim == 2 else a
        except Exception:
            out[s] = None
    return t, out


t_mod, mod = trace_mod("networks/mod/simulation/output.hdf5", SPECIES)

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

for i, s in enumerate(SPECIES):
    r, c = i // cols + 1, i % cols + 1
    if rxd.get(s) is not None:
        fig.add_trace(
            go.Scatter(
                x=t_rxd,
                y=rxd[s],
                mode="lines",
                name="RxD",
                line=dict(color="#1f77b4", width=2),
                showlegend=(i == 0),
            ),
            row=r,
            col=c,
        )
    if mod.get(s) is not None:
        fig.add_trace(
            go.Scatter(
                x=t_mod,
                y=mod[s],
                mode="lines",
                name="mod (Nair)",
                line=dict(color="#ff7f0e", width=2, dash="dash"),
                showlegend=(i == 0),
            ),
            row=r,
            col=c,
        )
    fig.update_xaxes(title_text="t (s)", row=r, col=c)
    fig.update_yaxes(title_text="mM", row=r, col=c)

fig.update_layout(
    height=300 * rows,
    width=350 * cols,
    title="RxD cascade (solid) vs Nair .mod (dashed)",
    template="plotly_white",
)
fig.write_html("compare_rxd_vs_mod.html")
fig.write_image("compare_rxd_vs_mod.png", scale=2)
print("Wrote compare_rxd_vs_mod.html and .png")
