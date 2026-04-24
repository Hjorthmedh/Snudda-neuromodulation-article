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

    conc = np.arange(0, 10e-6, 0.1e-6)

    modulation = mod_min + ((mod_max - mod_min) * conc**hill_coefficient) / (
        conc**hill_coefficient + half_activation**hill_coefficient
    )

    channel_data[chan] = {
        'name': chan,
        'conc': conc,
        'modulation': modulation
    }

# --- Build kaf shift data ---
conc = np.arange(0, 10e-6, 0.1e-6)
shift_min  = param["mod_pka_shift_min_kaf_ms"]
shift_max  = param["mod_pka_shift_max_kaf_ms"]
shift_half = param["mod_pka_shift_half_kaf_ms"]
shift_hill = param["mod_pka_shift_hill_kaf_ms"]

shift = shift_min + ((shift_max - shift_min) * conc**shift_hill) / (
    conc**shift_hill + shift_half**shift_hill
)
kaf_shift_data = {'conc': conc, 'shift': shift}


# --- Font sizes ---
TITLE_SIZE  = 30
LABEL_SIZE  = 25
TICK_SIZE   = 20
LEGEND_SIZE = 20


# --- Helper: style lookup ---
def get_style(name):
    if 'sk' in name or 'ka' in name:
        color = '#b2182b'
    elif 'ca' in name:
        color = '#ef8a62'
    elif 'naf' in name:
        color = '#555555'
    else:
        color = '#777777'

    linestyle = {"cal13_ms": "-.", "car_ms": "--", "kaf_ms": "-.", "kas_ms": "--"}.get(name, "-")
    linewidth = 3 if 'sk' in name else 2
    return color, linestyle, linewidth


# --- Two subplots sharing the x-axis ---
fig, (ax1, ax2) = plt.subplots(
    2, 1,
    figsize=(10, 10),
    sharex=True,
    gridspec_kw={'height_ratios': [2, 1]}
)


sort_order = ["sk_ms", "kaf_ms", "kas_ms", "naf_ms", "cal12_ms", "cal13_ms", "car_ms"]

missing = set(channel_data.keys()) - set(sort_order)
if len(missing) > 0:
    print(f"Missing keys: {missing}")
    import pdb
    pdb.set_trace()

# --- Top subplot: modulation curves ---
for k in sort_order:
    data = channel_data[k]
    name = data['name']

    if all(data["modulation"] == 1):
        print(f"Skipping {name}, modulation 1 always")
        continue

    if name in ("cal12_ms", "cal13_ms"):
        if all(channel_data["cal12_ms"]["conc"] == channel_data["cal13_ms"]["conc"]):
            if name == "cal12_ms":
                name = "cal"
            else:
                continue

    color, linestyle, linewidth = get_style(name)
    ax1.plot(
        data['conc'] * 1e6,
        data['modulation'],
        label=name.replace("_ms", ""),
        color=color,
        linestyle=linestyle,
        linewidth=linewidth
    )

ax1.set_ylabel("Factor", size=LABEL_SIZE)
ax1.tick_params(axis='y', labelsize=TICK_SIZE)
ax1.yaxis.set_major_locator(MultipleLocator(0.25))
ax1.spines['top'].set_visible(False)
ax1.spines['right'].set_visible(False)
ax1.set_title("Conductance change", size=TITLE_SIZE, pad=8)
ax1.legend(loc="center left", bbox_to_anchor=(1.02, 0.5), fontsize=LEGEND_SIZE, frameon=False)

# --- Bottom subplot: kaf shift ---
color, linestyle, linewidth = get_style("kaf_ms")
ax2.plot(
    kaf_shift_data['conc'] * 1e6,
    kaf_shift_data['shift'],
    label="kaf",
    color=color,
    linestyle=linestyle,
    linewidth=linewidth
)
ax2.axhline(0, color='#cccccc', linewidth=1, zorder=0)

ax2.set_xlabel("PKAc (nM)", size=LABEL_SIZE)
ax2.set_ylabel("Shift (mV)", size=LABEL_SIZE)
ax2.tick_params(axis='both', labelsize=TICK_SIZE)
ax2.xaxis.set_major_locator(plt.MaxNLocator(5))
ax2.spines['top'].set_visible(False)
ax2.spines['right'].set_visible(False)
ax2.set_title("Half activation shift", size=TITLE_SIZE, pad=8)
ax2.legend(loc="center left", bbox_to_anchor=(1.02, 0.5), fontsize=LEGEND_SIZE, frameon=False)

# --- Output ---
fig.subplots_adjust(left=0.2, right=0.72, top=0.94, bottom=0.1, hspace=0.35)
plt.savefig("ion_channel_modulation_curves_all.pdf", bbox_inches='tight')
plt.ion()
plt.show()

input("Press a key")
