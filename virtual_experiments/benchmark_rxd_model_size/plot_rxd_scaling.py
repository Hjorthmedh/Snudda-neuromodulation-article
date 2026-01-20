import json
import numpy as np
import matplotlib.pyplot as plt

# Optional: load from JSON
with open("run_time.json") as f:
    run_time = json.load(f)

# Extract data
sizes = np.array([int(k) for k in run_time.keys()])
durations = np.array([v["duration"] for v in run_time.values()])

# Sort by size (important for lines)
order = np.argsort(sizes)
sizes = sizes[order]
durations = durations[order]

# Create figure
fig, ax = plt.subplots(figsize=(4.5, 3.5))  # good for single-column papers

# Plot data
ax.plot(
    sizes,
    durations,
    marker="o",
    linestyle="-",
    linewidth=1.5,
    markersize=5,
    label="Measured runtime"
)

# Linear scaling reference line (O(N))
if False:
    ref = durations[0] * (sizes / sizes[0])
    ax.plot(
        sizes,
        ref,
        linestyle="--",
        linewidth=1.5,
        label="Linear scaling"
    )

plt.title(
    "Simulation of different system sizes",
    fontsize=13,
    pad=10
)
    
# Log-log axes
ax.set_xscale("log")
ax.set_yscale("log")

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

ax.spines["left"].set_linewidth(1.0)
ax.spines["bottom"].set_linewidth(1.0)
ax.tick_params(direction="out", width=1.0)

# Labels
ax.set_xlabel("Number of RxD species")
ax.set_ylabel("Runtime (s)")

# Grid (subtle, publication-friendly)
# ax.grid(True, which="both", linestyle=":", linewidth=0.5)
ax.grid(False)


# Legend
# ax.legend(frameon=False)

# Tight layout
fig.tight_layout()

# Save figures
fig.savefig("runtime_scaling.pdf")
fig.savefig("runtime_scaling.png", dpi=300)

plt.close(fig)
