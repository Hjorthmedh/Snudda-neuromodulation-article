import os
import json
import numpy as np
import matplotlib.pyplot as plt
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
JSON_FILE = "../../data/JSON/synapse-param-plasticity.json"

with open(JSON_FILE) as f:
    data = json.load(f)

key = sys.argv[1] if len(sys.argv) > 1 else list(data.keys())[0]
synapse_params = data[key]["synapse"]
print(f"Using parameter set: '{key}'")

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
for name, value in synapse_params.items():
    bk = base_key(name)
    if bk is None:
        continue
    groups.setdefault(bk, {})
    for s in SUFFIXES:
        if name.endswith(s):
            groups[bk][s[1:]] = value

hill_groups = {
    bk: d for bk, d in groups.items()
    if all(k in d for k in ("min", "max", "half", "hill"))
}

print(f"\nFound {len(hill_groups)} Hill-function groups:")
for bk, d in hill_groups.items():
    direction = "↘ decreasing" if d["max"] < d["min"] else "↗ increasing"
    print(f"  {bk:50s}  min={d['min']:.4g}  max={d['max']:.4g}  "
          f"half={d['half']:.3g} mM  n={d['hill']}  {direction}")

# ---------------------------------------------------------------------------
# Plot
# ---------------------------------------------------------------------------
conc = np.linspace(1e-12, 2000e-6, 3000)
COLORS = plt.rcParams["axes.prop_cycle"].by_key()["color"]

fig, ax = plt.subplots(figsize=(9, 5))
fig.suptitle(f"Hill modulation curves — parameter set '{key}'\n"
             r"$f = \mathrm{min} + (\mathrm{max}-\mathrm{min})"
             r"\cdot\dfrac{[\mathrm{c}]^n}{[\mathrm{c}]^n+[\mathrm{half}]^n}$",
             fontsize=12)

for idx, (bk, d) in enumerate(hill_groups.items()):
    color = COLORS[idx % len(COLORS)]
    decreasing = d["max"] < d["min"]
    y  = hill(conc, d["max"], d["min"], d["half"], d["hill"]) if decreasing \
         else hill(conc, d["min"], d["max"], d["half"], d["hill"])
    ls = "--" if decreasing else "-"
    ax.plot(conc * 1e6, y, linestyle=ls, color=color,
            linewidth=1.6, label=bk.replace("mod_", ""))
    ax.axvline(d["half"] * 1e6, color=color, linewidth=0.5, alpha=0.35)

ax.axhline(1.0, color="gray", linewidth=0.6, linestyle="-", alpha=0.35)
ax.set_xlabel("Concentration (µM)", fontsize=11)
ax.set_ylabel("Modulation factor", fontsize=11)
ax.set_xlim(0, 2000)
ax.grid(True, alpha=0.22)
ax.spines[["top", "right"]].set_visible(False)
ax.legend(loc="center left", bbox_to_anchor=(1.01, 0.5),
          fontsize=8, frameon=True, framealpha=0.9,
          title="Group (dashed = decreasing)")

plt.tight_layout()
os.makedirs("figures", exist_ok=True)
out = os.path.join("figures", f"synapse-param-plasticity_set{key}_hill.png")
plt.savefig(out, dpi=150, bbox_inches="tight")
print(f"\nSaved: {out}")
