import sys
import numpy as np
import h5py
import plotly.graph_objects as go
import plotly.colors as pc
from snudda.neurons.morphology_data import MorphologyData

if len(sys.argv) != 2:
    print(f"Usage {sys.argv[0]} <simulation file>")
    sys.exit()

sim_name = sys.argv[1]
sf = h5py.File(sim_name, "r")

t = sf["time"][()].copy()
cal = sf["neurons"]["0"]["cal"][()].copy()
sec_id = sf["neurons"]["0"]["cal"].attrs["sec_id"]
sec_x = sf["neurons"]["0"]["cal"].attrs["sec_x"]
morphology = sf["meta_data"]["morphology"][()][0].decode()
print(f"{morphology = }")
md = MorphologyData(swc_file=morphology)

# First pass: compute all soma distances
soma_distances = []
for sid, sx in zip(sec_id, sec_x):
    if sid == -1:
        d = float(md.sections[1][0].soma_distance_at(sx) * 1e6)
    else:
        d = float(md.sections[3][sid].soma_distance_at(sx) * 1e6)
    soma_distances.append(d)

d_min, d_max = min(soma_distances), max(soma_distances)

def dist_to_color(d):
    """Map soma distance to a hex color using the Viridis colorscale."""
    t_norm = (d - d_min) / (d_max - d_min) if d_max > d_min else 0.0
    low  = pc.unconvert_from_RGB_255(pc.hex_to_rgb("#440154"))  # viridis min
    high = pc.unconvert_from_RGB_255(pc.hex_to_rgb("#FDE725"))  # viridis max
    rgb = tuple(int((low[j] + t_norm * (high[j] - low[j])) * 255) for j in range(3))
    return f"rgb{rgb}"

colorscale = "Viridis"

fig = go.Figure()

for i, (sid, sx, d) in enumerate(zip(sec_id, sec_x, soma_distances)):
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
            "<b>Time:</b> %{x}<br>"
            "<b>Ca²⁺:</b> %{y}<br>"
            "<extra></extra>"
        ),
        customdata=np.column_stack([
            np.full(len(t), sid),
            np.full(len(t), sx),
            np.full(len(t), d),
        ])
    ))

# Add a colorbar via a dummy scatter trace
fig.add_trace(go.Scatter(
    x=[None], y=[None],
    mode="markers",
    marker=dict(
        colorscale=colorscale,
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
    xaxis_title="Time",
    yaxis_title="[Ca²⁺]",
    template="plotly_dark",
    showlegend=False,
)

fig.show()

import pdb
pdb.set_trace()
