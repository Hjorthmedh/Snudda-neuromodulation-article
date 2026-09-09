import os
import pandas as pd
import matplotlib.pyplot as plt

# Main (no-RxD / MOD) benchmark file
filename = "run_times_dardel_MOD.csv"

# Optional second benchmark file for the equivalent RxD run.
# Set to None (or just leave the file missing on disk) to exclude it -
# the script will fall back to plotting only the MOD data.
filename_rxd = "run_times_dardel_RXD.csv"


def load_benchmark(path):
    """Read a benchmark CSV, drop missing runs, sort by node count,
    and return (nodes, duration_in_hours).

    Assumes a 'nodes' column plus exactly one runtime column (in
    seconds) - the runtime column's name doesn't need to match
    between files (e.g. 'runtime_mod' vs 'runtime_rxd')."""
    df = pd.read_csv(path, skipinitialspace=True)
    value_col = [c for c in df.columns if c != "nodes"][0]
    df = df.dropna(subset=[value_col])
    df = df.sort_values("nodes")
    return df["nodes"], df[value_col] / 3600.0  # seconds -> hours


# Read data from CSV
nodes, duration = load_benchmark(filename)

# Ideal linear scaling (strong scaling), anchored to the smallest
# available node count (not necessarily 1, since low-node runs may
# still be missing)
n_ref = nodes.iloc[0]
T_ref = duration.iloc[0]
ideal_duration = T_ref * n_ref / nodes

# Optionally read the RxD data, if the file exists
has_rxd = filename_rxd is not None and os.path.isfile(filename_rxd)
if has_rxd:
    nodes_rxd, duration_rxd = load_benchmark(filename_rxd)

# Create figure
plt.figure(figsize=(4.5, 3.5), dpi=300)

# Plot
plt.plot(
    nodes,
    duration,
    marker="o",
    linewidth=2,
    markersize=6,
    color="0",
    label="No RxD"
)

# Plot RxD data, if available
if has_rxd:
    plt.plot(
        nodes_rxd,
        duration_rxd,
        linestyle="-.",
        marker=".",
        linewidth=2,
        markersize=6,
        color="0.5",
        label="With RxD"
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

plt.legend(fontsize=10, loc='best')

plt.xscale("log")
plt.yscale("log")

# Labels and title
plt.xlabel("Number of nodes", fontsize=12)
plt.ylabel("Duration (hours)", fontsize=12)

# Ticks
plt.xticks(fontsize=10)
plt.yticks(fontsize=10)

ax = plt.gca()

# Grid
ax.grid(False)
ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)
ax.spines["left"].set_linewidth(1.0)
ax.spines["bottom"].set_linewidth(1.0)
ax.tick_params(direction="out", width=1.0)

plt.title(
    "Simulation of 128 dSPN on HPE Cray EX",
    fontsize=13,
    pad=10
)

# Tight layout for publication
plt.tight_layout()

# Save figure (recommended for publication)
plt.savefig("benchmark_scaling_dardel_mod_rxd.pdf", bbox_inches='tight')
plt.savefig("benchmark_scaling_dardel_mod_rxd.png", bbox_inches='tight')
