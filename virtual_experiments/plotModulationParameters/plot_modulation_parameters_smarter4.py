import json
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator
import argparse

# --- Argument parsing ---
parser = argparse.ArgumentParser(description='Plot ion channel modulation curves from JSON file')
parser.add_argument('modulation_file', type=str, help='Path to the modulation JSON file')
parser.add_argument('--param-key', type=str, default='abc', help='Parameter key to extract from JSON (default: abc)')
args = parser.parse_args()
param_key = args.param_key

# --- Load data ---
with open(args.modulation_file, "rt") as f:
    par_data = json.load(f)[param_key]

param = {}
for d in par_data:
    param[d["param_name"]] = d["value"]

channels = np.unique(["_".join(x.split("_")[-2:]) for x in param.keys()])

# --- Build channel data ---
channel_data = {}
for chan in channels:
    if f"mod_pka_g_min_{chan}" in param:
        mod_min = param[f"mod_pka_g_min_{chan}"]
        mod_max = param[f"mod_pka_g_max_{chan}"]
        half_activation = param[f"mod_pka_g_half_{chan}"]
        hill_coefficient = param[f"mod_pka_g_hill_{chan}"]
    elif f"mod_pka_p_min_{chan}" in param:
        mod_min = param[f"mod_pka_p_min_{chan}"]
        mod_max = param[f"mod_pka_p_max_{chan}"]
        half_activation = param[f"mod_pka_p_half_{chan}"]
        hill_coefficient = param[f"mod_pka_p_hill_{chan}"]
    else:
        print(f"Skipping {chan}")
        continue

    # conc = np.arange(0, half_activation * 3, half_activation / 100)
    conc = np.arange(0, 10e-6, 0.1e-6)

    modulation = mod_min + ((mod_max - mod_min) * conc**hill_coefficient) / (
        conc**hill_coefficient + half_activation**hill_coefficient
    )

    channel_data[chan] = {
        'name': chan,
        'conc': conc,
        'modulation': modulation
    }
    
# --- Plot ---
plt.figure(figsize=(8, 6))

sort_order = ["sk_ms", "kaf_ms", "kas_ms",  "naf_ms", "cal12_ms", "cal13_ms", "car_ms",]

missing = set(channel_data.keys()) - set(sort_order)
if len(missing) > 0:
    print(f"Missing keys: {missing}")
    import pdb
    pdb.set_trace()


for k in sort_order:  # channel_data.keys():
    data = channel_data[k]
    name = data['name']

    if all(data["modulation"] == 1):
        print(f"Skipping {name}, modulation 1 always")
        continue

    if name == "cal12_ms" or name == "cal13_ms":
        if all(channel_data["cal12_ms"]["conc"] == channel_data["cal13_ms"]["conc"]):
            if name == "cal12_ms":
                name = "cal"
            else:
                # If cal12 and cal13 are identical, show only cal12 as "cal" and skip cal 13
                continue

    # --- Structured color mapping ---
    if 'sk' in name or "ka" in name:
        color = '#b2182b'   # strong red (primary)
    elif 'ca' in name:
        color = '#ef8a62'   # softer red
#    elif 'kaf' in name:
#        color = '#999999'   # neutral
    elif 'naf' in name:
        color = '#555555'   # darker grey
#    elif 'naf' in name:
#        color = '#bbbbbb'   # light grey
    else:
        color = '#777777'   # fallback

    # --- Simple line style grouping ---
    # linestyle = '-' if 'ca' in name or "sk_ms" == name else '--'
    linestyle = {"cal13_ms": "-.", "car_ms": "--",  "kaf_ms": "-.", "kas_ms": "--"}.get(name, "-")

    # --- Minimal emphasis ---
    linewidth = 3 if 'sk' in name else 2

    plt.plot(
        data['conc'] * 1e6,
        data['modulation'],
        label=name.replace("_ms", ""),
        color=color,
        linestyle=linestyle,
        linewidth=linewidth
    )

# --- Axes ---
plt.xlabel("PKAc (nM)", size=24)
plt.ylabel("Modulation", size=24)
plt.xticks(fontsize=20)
plt.yticks(fontsize=20)

ax = plt.gca()
ax.xaxis.set_major_locator(plt.MaxNLocator(5))
ax.yaxis.set_major_locator(MultipleLocator(0.25))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

# --- Title & legend ---
plt.title("Modulation", size=30)
plt.legend(loc="center left", bbox_to_anchor=(1, 0.5), fontsize=14, frameon=False)

# --- Output ---
plt.tight_layout()
plt.savefig("ion_channel_modulation_curves.pdf")
plt.ion()
plt.show()

input("Press a key")
