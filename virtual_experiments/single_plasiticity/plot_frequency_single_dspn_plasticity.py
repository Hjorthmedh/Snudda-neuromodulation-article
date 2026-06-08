import os
import matplotlib.pyplot as plt
from matplotlib.lines import Line2D

from snudda.utils.load_network_simulation import SnuddaLoadSimulation


network_path = "networks/single_dspn"
simulation_file = os.path.join(network_path, "simulation/output.hdf5")

sls = SnuddaLoadSimulation(network_path=network_path,
                           network_simulation_output_file=simulation_file)

freq_table = sls.get_frequency(neuron_id=[0, 1],time_ranges=((1.1,1.6),(25.1,25.6)))






# Publication-ready parameters
plt.rcParams['font.size'] = 12
plt.rcParams['font.family'] = 'sans-serif'
plt.rcParams['axes.linewidth'] = 1.0

fig, ax = plt.subplots(figsize=(2.8, 4))

x = [0, 1]

# ---- Cell 0 (never gets DA) ----
ax.plot(
    x,
    freq_table[0, :],
    'k-',
    linewidth=1.0,
    zorder=1
)

ax.plot(
    x,
    freq_table[0, :],
    'ko',
    markersize=10,
    markerfacecolor='k',
    zorder=2
)

# ---- Cell 1 (DA only during first pulse) ----
ax.plot(
    x,
    freq_table[1, :],
    'k-',
    linewidth=1.0,
    zorder=1
)

# First pulse = DA present
ax.plot(
    x[0],
    freq_table[1, 0],
    'o',
    markersize=10,
    color='red',
    zorder=3
)

# Second pulse = no DA
ax.plot(
    x[1],
    freq_table[1, 1],
    'ko',
    markersize=10,
    markerfacecolor='k',
    zorder=3
)

# Labels
ax.set_xticks(x)
ax.set_xticklabels([
    'First pulse\n(at 1 s)',
    'Second pulse\n(at 25 s)'
])

ax.set_ylabel('Frequency (Hz)', fontsize=12)

# Clean axes
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.spines['left'].set_position(('outward', 5))
ax.spines['bottom'].set_position(('outward', 5))

ax.tick_params(axis='both', which='major', labelsize=10)

ax.set_ylim(bottom=0)
ax.set_xlim(-0.15, 1.15)

# Legend
legend_elements = [
    Line2D([0], [0],
           marker='o',
           color='none',
           markerfacecolor='red',
           markeredgecolor='red',
           markersize=8,
           label='DA present'),

    Line2D([0], [0],
           marker='o',
           color='none',
           markerfacecolor='black',
           markeredgecolor='black',
           markersize=8,
           label='No DA')
]

if False:
  ax.legend(
      handles=legend_elements,
      frameon=False,
      fontsize=10,
      loc='upper left'
   )

plt.tight_layout()

plt.savefig(
    'figures/da_plasticity.png',
    dpi=300,
    bbox_inches='tight'
)

plt.savefig(
    'figures/da_plasticity.pdf',
    bbox_inches='tight'
)

plt.show()

input("Press a key")

