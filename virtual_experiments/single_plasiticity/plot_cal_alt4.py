import sys
import numpy as np
import h5py
import plotly.graph_objects as go
import plotly.colors as pc
from snudda.neurons.morphology_data import MorphologyData

if len(sys.argv) != 3:
    print(f"Usage {sys.argv[0]} <simulation file> <neuron_id>")
    sys.exit()

sim_name = sys.argv[1]
neuron_id = int(sys.argv[2])
sf = h5py.File(sim_name, "r")

t = sf["time"][()].copy()
cal = sf["neurons"][str(neuron_id)]["cal"][()].copy() * 1e6 # mM -> nM
sec_id = sf["neurons"][str(neuron_id)]["cal"].attrs["sec_id"]
sec_x = sf["neurons"][str(neuron_id)]["cal"].attrs["sec_x"]
morphology = sf["meta_data"]["morphology"][()][neuron_id].decode()
print(f"{morphology = }")
md = MorphologyData(swc_file=morphology)

# First pass: compute all soma distances and radii
soma_distances = []
radii = []
for sid, sx in zip(sec_id, sec_x):
    section = md.sections[1][0] if sid == -1 else md.sections[3][sid]
    soma_distances.append(float(section.soma_distance_at(sx) * 1e6))
    radii.append(float(section.radie_at(sx) * 1e6))

d_min, d_max = min(soma_distances), max(soma_distances)

def dist_to_color(d):
    """Map soma distance to a hex color using the Viridis colorscale."""
    t_norm = (d - d_min) / (d_max - d_min) if d_max > d_min else 0.0
    low  = pc.unconvert_from_RGB_255(pc.hex_to_rgb("#440154"))
    high = pc.unconvert_from_RGB_255(pc.hex_to_rgb("#FDE725"))
    rgb = tuple(int((low[j] + t_norm * (high[j] - low[j])) * 255) for j in range(3))
    return f"rgb{rgb}"

fig = go.Figure()

for i, (sid, sx, d, r) in enumerate(zip(sec_id, sec_x, soma_distances, radii)):
    fig.add_trace(go.Scatter(
        x=t,
        y=cal[i],
        mode="lines",
        name=f"{sid}({sx})",
        line=dict(color=dist_to_color(d)),
        hovertemplate=(
            "<b>Section ID:</b> %{customdata[0]}<br>"
            "<b>Section X:</b> %{customdata[1]}<br>"
            "<b>Soma distance:</b> %{customdata[2]:.2f} μm<br>"
            "<b>Radius:</b> %{customdata[3]:.4f} μm<br>"
            "<b>Time:</b> %{x:.4f} s<br>"
            "<b>Ca²⁺:</b> %{y:.4f} nM<br>"
            "<extra></extra>"
        ),
        customdata=np.column_stack([
            np.full(len(t), sid),
            np.full(len(t), sx),
            np.full(len(t), d),
            np.full(len(t), r),
        ])
    ))

# Dummy trace for colorbar
fig.add_trace(go.Scatter(
    x=[None], y=[None],
    mode="markers",
    marker=dict(
        colorscale="Viridis",
        cmin=d_min,
        cmax=d_max,
        color=[d_min, d_max],
        colorbar=dict(
            title="Soma dist (μm)",
            thickness=15,
            len=0.75,
        ),
        showscale=True,
    ),
    hoverinfo="none",
    showlegend=False,
))

fig.update_layout(
    title="Calcium Traces",
    xaxis_title="Time (s)",
    yaxis_title="[Ca²⁺] (nM)",
    template="plotly_dark",
    showlegend=False,
)

fig.show()

import pdb
pdb.set_trace()
