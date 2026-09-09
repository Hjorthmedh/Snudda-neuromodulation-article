import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FixedLocator, FixedFormatter


# ------------------------------------------------------------
# Load data
#
# Script is run from:
# figures/figure5C-benchmark
#
# Benchmark data are located in:
# virtual_experiments/benchmark_dardel_RxD
# virtual_experiments/benchmark_dardel_MOD
# ------------------------------------------------------------

rxd = pd.read_csv(
    "../../virtual_experiments/benchmark_dardel_RxD/"
    "benchmark_dardel_rxd_runtime.csv"
)

mod = pd.read_csv(
    "../../virtual_experiments/benchmark_dardel_MOD/"
    "benchmark_dardel_MOD_runtime.csv"
)


# ------------------------------------------------------------
# Explicitly convert data columns to numeric
# ------------------------------------------------------------

for data in (rxd, mod):
    data["num_workers"] = pd.to_numeric(
        data["num_workers"],
        errors="coerce",
    )

    if "run_time" in data.columns:
        data["run_time"] = pd.to_numeric(
            data["run_time"],
            errors="coerce",
        )

    if "estimated_run_time" in data.columns:
        data["estimated_run_time"] = pd.to_numeric(
            data["estimated_run_time"],
            errors="coerce",
        )


# ------------------------------------------------------------
# Create figure
# ------------------------------------------------------------

fig, ax = plt.subplots(figsize=(4.5, 3.5))


# ------------------------------------------------------------
# Plot one simulation
# ------------------------------------------------------------

def plot_runtime(data, name, color):

    # --------------------------------------------------------
    # Measured runtime
    # --------------------------------------------------------

    if "run_time" in data.columns:

        measured = (
            data[
                data["run_time"].notna()
                & data["num_workers"].notna()
            ]
            .sort_values("num_workers")
        )

        if not measured.empty:
            ax.plot(
                measured["num_workers"],
                measured["run_time"],
                marker="o",
                linestyle="-",
                linewidth=1.5,
                markersize=5,
                color=color,
                markerfacecolor=color,
                markeredgecolor=color,
                label=f"{name} measured",
            )

    # --------------------------------------------------------
    # Estimated runtime
    # --------------------------------------------------------

    if "estimated_run_time" in data.columns:

        estimated = (
            data[
                data["estimated_run_time"].notna()
                & data["num_workers"].notna()
            ]
            .sort_values("num_workers")
        )

        if not estimated.empty:
            ax.plot(
                estimated["num_workers"],
                estimated["estimated_run_time"],
                marker="o",
                linestyle="--",
                linewidth=1.5,
                markersize=5,
                color=color,
                markerfacecolor="none",
                markeredgecolor=color,
                label=f"{name} estimated (from partial run)",
            )


# ------------------------------------------------------------
# Plot RxD and MOD
# ------------------------------------------------------------

plot_runtime(rxd, "RxD", "black")
plot_runtime(mod, "MOD", "red")


# ------------------------------------------------------------
# Logarithmic axes
# ------------------------------------------------------------

ax.set_xscale("log")
ax.set_yscale("log")


# ------------------------------------------------------------
# X-axis ticks
#
# Show 1, 2, 4, 8, 16, 32, 64, 128 rather than 10^0 etc.
# ------------------------------------------------------------

worker_ticks = [1, 2, 4, 8, 16, 32, 64, 128]

ax.xaxis.set_major_locator(
    FixedLocator(worker_ticks)
)

ax.xaxis.set_major_formatter(
    FixedFormatter([str(x) for x in worker_ticks])
)


# ------------------------------------------------------------
# Labels and title
# ------------------------------------------------------------

ax.set_xlabel(
    "Number of workers",
    fontsize=12,
)

ax.set_ylabel(
    "Runtime (s)",
    fontsize=12,
)

ax.set_title(
    "Runtime of RxD and MOD simulation",
    fontsize=13,
    pad=10,
)


# ------------------------------------------------------------
# Style
# ------------------------------------------------------------

ax.spines["top"].set_visible(False)
ax.spines["right"].set_visible(False)

ax.spines["left"].set_linewidth(1.0)
ax.spines["bottom"].set_linewidth(1.0)

ax.tick_params(
    direction="out",
    width=1.0,
)

plt.xticks(fontsize=10)
plt.yticks(fontsize=10)

ax.grid(False)


# ------------------------------------------------------------
# Legend
# ------------------------------------------------------------

ax.legend(
    frameon=False,
    fontsize=10,
    loc="best",
)


# ------------------------------------------------------------
# Layout
# ------------------------------------------------------------

fig.tight_layout()


# ------------------------------------------------------------
# Save
# ------------------------------------------------------------

print("Writing rxd_mod_runtime_scaling.png and .pdf")

fig.savefig(
    "rxd_mod_runtime_scaling.pdf",
    bbox_inches="tight",
)

fig.savefig(
    "rxd_mod_runtime_scaling.png",
    dpi=300,
    bbox_inches="tight",
)

plt.close(fig)

