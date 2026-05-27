import os
import json
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import sys

# ---------------------------------------------------------------------------
# Hill function (matches NMODL implementation exactly)
# ---------------------------------------------------------------------------
def hill(conc, mod_min, mod_max, half_activation, hill_coeff):
    powered      = np.power(conc, hill_coeff)
    half_powered = np.power(half_activation, hill_coeff)
    return mod_min + (mod_max - mod_min) * powered / (powered + half_powered)


# ---------------------------------------------------------------------------
# Load JSON
# ---------------------------------------------------------------------------
JSON_FILE = sys.argv[1] if len(sys.argv) > 1 else "params.json"

with open(JSON_FILE) as f:
    data = json.load(f)

params_list = data[list(data.keys())[0]]
params = {p["param_name"]: p["value"] for p in params_list}

# ---------------------------------------------------------------------------
# Group parameters into Hill-function sets (min / max / half / hill)
# ---------------------------------------------------------------------------
SUFFIXES = ("_min", "_max", "_half", "_hill")

def base_key(name):
    for s in SUFFIXES:
        if name.endswith(s):
            return name[: -len(s)]
    return None

groups = {}
for name, value in params.items():
    bk = base_key(name)
    if bk is None:
        continue
    groups.setdefault(bk, {})
    for s in SUFFIXES:
        if name.endswith(s):
            groups[bk][s[1:]] = value  # store without leading underscore

# Keep only complete groups (all four keys present)
hill_groups = {
    bk: d for bk, d in groups.items()
    if all(k in d for k in ("min", "max", "half", "hill"))
}

print(f"Found {len(hill_groups)} Hill-function groups:")
for bk, d in hill_groups.items():
    direction = "↘ decreasing" if d["max"] < d["min"] else "↗ increasing"
    print(f"  {bk:50s}  min={d['min']:.4g}  max={d['max']:.4g}  "
          f"half={d['half']:.3g} mM  n={d['hill']}  {direction}")

# ---------------------------------------------------------------------------
# Two concentration ranges
# ---------------------------------------------------------------------------
ranges = [
    ("Zoom: 0 – 600 µM",  np.linspace(1e-12, 600e-6,  3000)),
    ("Full: 0 – 1200 µM", np.linspace(1e-12, 1200e-6, 3000)),
]

COLORS = plt.rcParams["axes.prop_cycle"].by_key()["color"]

fig = plt.figure(figsize=(16, 6))
fig.suptitle("Hill modulation curves from parameter file\n"
             r"$f = \mathrm{min} + (\mathrm{max}-\mathrm{min})"
             r"\cdot\dfrac{[\mathrm{c}]^n}{[\mathrm{c}]^n+[\mathrm{half}]^n}$",
             fontsize=12, y=1.01)

gs = gridspec.GridSpec(1, 2, figure=fig, wspace=0.30)

for col, (range_label, conc) in enumerate(ranges):
    ax = fig.add_subplot(gs[col])

    for idx, (bk, d) in enumerate(hill_groups.items()):
        color = COLORS[idx % len(COLORS)]

        # Detect decreasing curves (mod file swaps min/max in the call)
        decreasing = d["max"] < d["min"]
        if decreasing:
            y  = hill(conc, d["max"], d["min"], d["half"], d["hill"])
            ls = "--"
        else:
            y  = hill(conc, d["min"], d["max"], d["half"], d["hill"])
            ls = "-"

        short = bk.replace("mod_", "")
        ax.plot(conc * 1e6, y, linestyle=ls, color=color,
                linewidth=1.6, label=short)

        # Light vertical line at half-activation if within range
        if d["half"] * 1e6 <= conc[-1] * 1e6:
            ax.axvline(d["half"] * 1e6, color=color, linewidth=0.5, alpha=0.35)

    ax.axhline(1.0, color="gray", linewidth=0.6, linestyle="-", alpha=0.35)
    ax.set_xlabel("Concentration (µM)", fontsize=11)
    ax.set_ylabel("Modulation factor", fontsize=11)
    ax.set_title(range_label, fontsize=11)
    ax.set_xlim(0, conc[-1] * 1e6)
    ax.grid(True, alpha=0.22)
    ax.spines[["top", "right"]].set_visible(False)

handles, labels = fig.axes[0].get_legend_handles_labels()
fig.legend(handles, labels,
           loc="center left", bbox_to_anchor=(1.01, 0.5),
           fontsize=8, frameon=True, framealpha=0.9,
           title="Group (dashed = decreasing)")

plt.tight_layout()
os.makedirs("figures", exist_ok=True)
out = os.path.join("figures", os.path.basename(JSON_FILE.replace(".json", "_hill.png")))
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"\nSaved: {out}")
