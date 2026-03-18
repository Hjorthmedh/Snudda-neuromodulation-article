import os
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

from snudda.utils import SnuddaLoadSimulation

network_path = "networks/santos_fig3/"
simulation_file = os.path.join(network_path, "simulation", "output.hdf5")

sls = SnuddaLoadSimulation(network_path=network_path,
                           network_simulation_output_file=simulation_file)


neuron_id = np.array([0,1,2,3,4,5,6,7,8])
offset = np.array([-4,-3,-2,-1,0,1,2,3,4])

synapse_start = 4 + offset
t_window = 15

section_id = 10

substrate = "pSubstrate"

no_da_neuron_id = 9

time = sls.get_time()

peak_val = []
area = []

for idx, nid in enumerate(neuron_id):
    all_data = sls.get_all_data(neuron_id=nid,
                                exclude=["spikes", "voltage"])

    t_idx = np.where(np.logical_and(synapse_start[idx] <= time,
                                    time < synapse_start[idx] + t_window))[0]
    
    data = all_data[substrate]

    comp_id = np.where(data[1][nid][0] == section_id)[0][0]


    try:
        conc = data[0][nid][:,comp_id][t_idx]

        peak_val.append(np.max(conc))
        area.append(np.sum((conc - np.min(conc))[:-1] * np.diff(time[t_idx])))

    except:
        import traceback
        print(traceback.format_exc())
        import pdb
        pdb.set_trace()
        
#   
# TODO: 10 ggr för hög calcium?
#

# offset is negative, since we have different convention than in Santos

plt.figure()
plt.plot(-offset, peak_val)
plt.xlabel("Time delta (s)")
plt.ylabel("Peak substrate (mM)")
plt.savefig("figures/time_delta_peak_substrate.png")
plt.ion()
plt.show()

plt.figure()
plt.plot(-offset, area)
plt.xlabel("Time delta (s)")
plt.ylabel("Area substrate (mM*s)")
plt.savefig("figures/time_delta_area_substrate.png")
plt.ion()
plt.show()

# input()
    

# ── Publication style ────────────────────────────────────────────────────────
plt.rcParams.update({
    # Font
    "font.family":        "serif",
    "font.serif":         ["Times New Roman", "DejaVu Serif"],
    "font.size":          10,
    "axes.titlesize":     11,
    "axes.labelsize":     10,
    "xtick.labelsize":    9,
    "ytick.labelsize":    9,
    "legend.fontsize":    9,
 
    # Lines & markers
    "lines.linewidth":    1.5,
    "lines.markersize":   5,
 
    # Axes
    "axes.linewidth":     0.8,
    "axes.spines.top":    False,
    "axes.spines.right":  False,
 
    # Ticks
    "xtick.direction":    "out",
    "ytick.direction":    "out",
    "xtick.major.width":  0.8,
    "ytick.major.width":  0.8,
    "xtick.major.size":   4,
    "ytick.major.size":   4,
    "xtick.minor.visible": True,
    "ytick.minor.visible": True,
    "xtick.minor.size":   2,
    "ytick.minor.size":   2,
    "xtick.minor.width":  0.6,
    "ytick.minor.width":  0.6,
 
    # Grid
    "axes.grid":          True,
    "grid.color":         "0.85",
    "grid.linewidth":     0.5,
    "grid.linestyle":     "--",
    "axes.axisbelow":     True,
 
    # Figure
    "figure.dpi":         300,
    "savefig.dpi":        300,
    "savefig.bbox":       "tight",
    "savefig.pad_inches": 0.05,
 
    # Math / text
    "text.usetex":        False,
    "mathtext.fontset":   "stix",
})
 
# Column width for a two-column journal figure (86 mm ≈ 3.39 in)
COL_W = 3.39
COL_H = 2.6   # ~golden ratio




x = -offset   # positive = DA leads spine input
 
# ── Helper: shared axis polish ───────────────────────────────────────────────
def polish_ax(ax, xlabel, ylabel):
    ax.set_xlabel(xlabel, labelpad=4)
    ax.set_ylabel(ylabel, labelpad=4)
    ax.xaxis.set_minor_locator(ticker.AutoMinorLocator())
    ax.yaxis.set_minor_locator(ticker.AutoMinorLocator())
    # Mark x=0 with a subtle vertical reference
    ax.axvline(0, color="0.6", linewidth=0.8, linestyle=":", zorder=1)
 
os.makedirs("figures", exist_ok=True)
 
# ── Figure 1 – Peak substrate ────────────────────────────────────────────────
fig1, ax1 = plt.subplots(figsize=(COL_W, COL_H))
ax1.plot(x, peak_val,
         color="#1f4e79", marker="o", markerfacecolor="white",
         markeredgewidth=1.2, clip_on=False, zorder=3)
polish_ax(ax1,
          xlabel=r"$\Delta t$ (s)",
          ylabel="Peak substrate (mM)")
fig1.savefig("figures/time_delta_peak_substrate.png")
 
# ── Figure 2 – Area substrate ────────────────────────────────────────────────
fig2, ax2 = plt.subplots(figsize=(COL_W, COL_H))
ax2.plot(x, area,
         color="#7b2d00", marker="o", markerfacecolor="white",
         markeredgewidth=1.2, clip_on=False, zorder=3)
polish_ax(ax2,
          xlabel=r"$\Delta t$ (s)",
          ylabel=r"Area substrate (mM$\cdot$s)")
fig2.savefig("figures/time_delta_area_substrate.png")
 
plt.ion()
plt.show()
input()
