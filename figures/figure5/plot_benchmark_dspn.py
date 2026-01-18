import pandas as pd
import matplotlib.pyplot as plt

# Read data from CSV
filename = "benchmark_1280_dspn_2s.csv"
data = pd.read_csv(filename, skipinitialspace=True)

filename_no_rxd = "benchmark_1280_dspn_2s_no_rxd.csv"
data_no_rxd = pd.read_csv(filename_no_rxd, skipinitialspace=True)


# Extract columns
nodes = data["number_of_nodes"]
duration = data["duration_in_s"] / 3600.0

nodes_no_rxd = data_no_rxd["number_of_nodes"]
duration_no_rxd = data_no_rxd["duration_in_s"] / 3600.0


# Ideal linear scaling (strong scaling)
T1 = duration[nodes == 1][0]
ideal_duration = T1 / nodes

T1_no_rxd = duration_no_rxd[nodes_no_rxd == 1][0]
ideal_duration_no_rxd = T1 / nodes_no_rxd


# Create figure
plt.figure(figsize=(7, 4), dpi=300)

# Plot
plt.plot(
    nodes,
    duration,
    marker="o",
    linewidth=2,
    markersize=6,
    color="0",
    label="With RxD"
)

# Plot
plt.plot(
    nodes_no_rxd,
    duration_no_rxd,
    linestyle="-.",
    marker=".",
    linewidth=2,
    markersize=6,
    color="0.5",
    label="No RxD"
)

# Ideal scaling reference
plt.plot(
    nodes,
    ideal_duration,
    linestyle="--",
    linewidth=2,
    color="0.75",
    label="Linear"
)

plt.legend(fontsize=10, loc='center left', bbox_to_anchor=(1, 0.5))


plt.xscale("log")
plt.yscale("log")


# Labels and title
plt.xlabel("Number of nodes", fontsize=12)
plt.ylabel("Duration (hours)", fontsize=12)

# Ticks
plt.xticks(fontsize=10)
plt.yticks(fontsize=10)

# Grid
plt.grid(True, linestyle="--", linewidth=0.5, alpha=0.7)

plt.title(
    "Simulation of 1000 dSPN on HPE Cray EX supercomputer",
    fontsize=13,
    pad=10
)

# Tight layout for publication
plt.tight_layout()

# Save figure (recommended for publication)
plt.savefig("benchmark_scaling.pdf", bbox_inches='tight')
plt.savefig("benchmark_scaling.png", bbox_inches='tight')

# Show
plt.show()
