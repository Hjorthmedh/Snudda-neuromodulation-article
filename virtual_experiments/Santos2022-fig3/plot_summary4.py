import os
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from snudda.utils import SnuddaLoadSimulation

# ── Publication style (matching Bevan-style clean figures) ───────────────────
plt.rcParams.update({
    # Font — sans-serif to match reference
    "font.family":          "sans-serif",
    "font.sans-serif":      ["Arial", "Helvetica", "DejaVu Sans"],
    "font.size":            9,
    "axes.titlesize":       9,
    "axes.labelsize":       9,
    "xtick.labelsize":      8,
    "ytick.labelsize":      8,

    # Lines
    "lines.linewidth":      1.0,
    "lines.markersize":     4,

    # Axes — open frame (no top/right spines), thin strokes
    "axes.linewidth":       0.8,
    "axes.spines.top":      False,
    "axes.spines.right":    False,

    # Ticks — outward, no minor ticks
    "xtick.direction":      "out",
    "ytick.direction":      "out",
    "xtick.major.width":    0.8,
    "ytick.major.width":    0.8,
    "xtick.major.size":     3.5,
    "ytick.major.size":     3.5,
    "xtick.minor.visible":  False,
    "ytick.minor.visible":  False,

    # No grid
    "axes.grid":            False,

    # Figure / saving
    "figure.dpi":           300,
    "savefig.dpi":          300,
    "savefig.pad_inches":   0.05,
    "savefig.bbox":         "tight",

    # Math
    "text.usetex":          False,
    "mathtext.fontset":     "stixsans",
})

# Single-column journal width: 86 mm ≈ 3.39 in
COL_W = 3.39
COL_H = 2.4

# ── Data loading ─────────────────────────────────────────────────────────────
network_path    = "networks/santos_fig3/"
simulation_file = os.path.join(network_path, "simulation", "output.hdf5")
sls = SnuddaLoadSimulation(network_path=network_path,
                           network_simulation_output_file=simulation_file)

neuron_id       = np.array([0, 1, 2, 3, 4, 5, 6, 7, 8])
offset          = np.array([-4, -3, -2, -1, 0, 1, 2, 3, 4])
synapse_start   = 4 + offset
t_window        = 15
section_id      = 10
substrate       = "pSubstrate"
no_da_neuron_id = 9

time     = sls.get_time()
peak_val = []
area     = []

for idx, nid in enumerate(neuron_id):
    all_data = sls.get_all_data(neuron_id=nid, exclude=["spikes", "voltage"])
    t_idx    = np.where(
        np.logical_and(synapse_start[idx] <= time,
                       time < synapse_start[idx] + t_window)
    )[0]
    data    = all_data[substrate]
    comp_id = np.where(data[1][nid][0] == section_id)[0][0]
    try:
        conc = data[0][nid][:, comp_id][t_idx]
        peak_val.append(np.max(conc))
        area.append(np.sum((conc - np.min(conc))[:-1] * np.diff(time[t_idx])))
    except Exception:
        import traceback
        print(traceback.format_exc())
        import pdb
        pdb.set_trace()

x = -offset   # positive Δt = DA leads spine input

# ── Helper ───────────────────────────────────────────────────────────────────
def polish_ax(ax, x_data, xlabel, ylabel, title=None):
    """Apply clean, minimal publication styling."""
    # Tight x-limits with minimal padding
    x_pad = (x_data.max() - x_data.min()) * 0.04
    ax.set_xlim(x_data.min() - x_pad, x_data.max() + x_pad)

    # Tight y-limits with minimal breathing room
    ylo, yhi = ax.get_ylim()
    y_pad = (yhi - ylo) * 0.06
    ax.set_ylim(ylo - y_pad, yhi + y_pad)

    ax.set_xlabel(xlabel, labelpad=3)
    ax.set_ylabel(ylabel, labelpad=3)

    # Sparse major ticks only — match the minimal look of the reference
    ax.xaxis.set_major_locator(ticker.MaxNLocator(nbins=5, integer=False))
    ax.yaxis.set_major_locator(ticker.MaxNLocator(nbins=4, integer=False))

    if title:
        ax.set_title(title, pad=4, fontweight="normal")

os.makedirs("figures", exist_ok=True)

# ── Figure 1 – Peak substrate ────────────────────────────────────────────────
fig1, ax1 = plt.subplots(figsize=(COL_W, COL_H))
ax1.plot(x, peak_val, color="black", marker="o",
         markersize=3.5, markerfacecolor="black",
         linewidth=1.0, zorder=3)
polish_ax(ax1, x,
          xlabel=r"$\Delta t$ (s)",
          ylabel="Peak substrate (mM)")
fig1.tight_layout()
fig1.savefig("figures/time_delta_peak_substrate.png")

# ── Figure 2 – Area substrate ────────────────────────────────────────────────
fig2, ax2 = plt.subplots(figsize=(COL_W, COL_H))
ax2.plot(x, area, color="black", marker="o",
         markersize=3.5, markerfacecolor="black",
         linewidth=1.0, zorder=3)
polish_ax(ax2, x,
          xlabel=r"$\Delta t$ (s)",
          ylabel=r"Area substrate (mM$\cdot$s)")
fig2.tight_layout()
fig2.savefig("figures/time_delta_area_substrate.png")

plt.ion()
plt.show()
input()
