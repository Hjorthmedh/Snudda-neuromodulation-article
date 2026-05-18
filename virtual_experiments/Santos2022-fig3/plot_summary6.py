import os
import numpy as np
import plotly.graph_objects as go
import plotly.io as pio
from snudda.utils import SnuddaLoadSimulation

# ── Load data ────────────────────────────────────────────────────────────────
network_path    = "networks/santos_fig3/"
simulation_file = os.path.join(network_path, "simulation", "output.hdf5")

sls = SnuddaLoadSimulation(
    network_path=network_path,
    network_simulation_output_file=simulation_file
)

neuron_id     = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8])
offset        = np.array([-4, -3, -2, -1, 0, 1, 2, 3, 4])
synapse_start = 4 + offset
t_window      = 15
section_id    = 10
substrate     = "pSubstrate"

MM_TO_UM = 1e3

time = sls.get_time()

peak_val = []
area = []

# ── Analysis ────────────────────────────────────────────────────────────────
for idx, nid in enumerate(neuron_id):

    all_data = sls.get_all_data(neuron_id=nid, exclude=["spikes", "voltage"])

    t_idx = np.where(
        (time >= synapse_start[idx]) &
        (time < synapse_start[idx] + t_window)
    )[0]

    data = all_data[substrate]
    comp_id = np.where(data[1][nid][0] == section_id)[0][0]

    conc = data[0][nid][:, comp_id][t_idx]

    peak_val.append(np.max(conc) * MM_TO_UM)

    area.append(
        np.sum((conc - np.min(conc))[:-1] * np.diff(time[t_idx])) * MM_TO_UM
    )

x = -offset

os.makedirs("figures", exist_ok=True)

# ── Shared Plotly style helper ───────────────────────────────────────────────

def style_fig(fig, title, x_label, y_label, width=800, height=300):
    fig.update_layout(
        width=width,
        height=height,
        paper_bgcolor="white",
        plot_bgcolor="white",
        font={"size": 15},
        title={
            "text": title,
            "x": 0.5,
            "xanchor": "center",
            "y": 0.9
        },
        margin=dict(l=80, r=20, t=60, b=60),
        showlegend=False
    )

    fig.update_xaxes(
        title_text=x_label,
        title_font=dict(size=15),
        tickfont=dict(size=15),
        showline=True,
        linecolor="black",
        linewidth=0.8,
        mirror=False,   # important: avoids full box
        ticks="outside",
        tickwidth=0.8,
        ticklen=4
    )

    fig.update_yaxes(
        title_text=y_label,
        title_font=dict(size=15),
        tickfont=dict(size=15),
        showline=True,
        linecolor="black",
        linewidth=0.8,
        mirror=False,
        ticks="outside",
        tickwidth=0.8,
        ticklen=4
    )

    return fig

# ── Figure 1 – Peak substrate ───────────────────────────────────────────────
fig1 = go.Figure()

fig1.add_trace(go.Scatter(
    x=x,
    y=np.array(peak_val),
    mode="lines+markers",
    line=dict(width=4, color="black"),
    marker=dict(size=6, color="black")
))

fig1 = style_fig(
    fig1,
    title="Peak substrate vs Δt",
    x_label=r"Δt (s)",
    y_label=r"Peak substrate (µM)"
)

fig1.write_image("figures/time_delta_peak_substrate.svg")
fig1.show()

# ── Figure 2 – Area substrate ───────────────────────────────────────────────
fig2 = go.Figure()

fig2.add_trace(go.Scatter(
    x=x,
    y=np.array(area),
    mode="lines+markers",
    line=dict(width=4, color="black"),
    marker=dict(size=6, color="black")
))

fig2 = style_fig(
    fig2,
    title="Area substrate vs Δt",
    x_label=r"Δt (s)",
    y_label=r"Area substrate (µM·s)"
)

fig2.write_image("figures/time_delta_area_substrate.svg")
fig2.show()

input()
