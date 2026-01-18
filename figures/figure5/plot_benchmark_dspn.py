import pandas as pd
import matplotlib.pyplot as plt

# Read data from CSV
filename = "benchmark_1280_dspn_2s.csv"
data = pd.read_csv(filename, skipinitialspace=True)

# Extract columns
nodes = data["number_of_nodes"]
duration = data["duration_in_s"]

# Ideal linear scaling (strong scaling)
T1 = duration[nodes == 1][0]
ideal_duration = T1 / nodes

# Create figure
plt.figure(figsize=(6, 4), dpi=300)

# Plot
plt.plot(
    nodes,
    duration,
    marker="o",
    linewidth=2,
    markersize=6,
    color="0",
    label="Execution time"
)

# Ideal scaling reference
plt.plot(
    nodes,
    ideal_duration,
    linestyle="--",
    linewidth=2,
    color="0.5",
    label="Ideal linear scaling"
)

plt.xscale("log")
plt.yscale("log")


# Labels and title
plt.xlabel("Number of nodes", fontsize=12)
plt.ylabel("Duration (s)", fontsize=12)

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
plt.savefig("benchmark_scaling.pdf")
plt.savefig("benchmark_scaling.png")

# Show
plt.show()
