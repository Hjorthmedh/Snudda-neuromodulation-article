import json
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator, AutoMinorLocator
import argparse

# Add command line argument parsing
parser = argparse.ArgumentParser(description='Plot ion channel modulation curves from JSON file')
parser.add_argument('modulation_file', type=str, help='Path to the modulation JSON file')
parser.add_argument('--param-key', type=str, default='abc', help='Parameter key to extract from JSON (default: abc)')
args = parser.parse_args()
param_key = args.param_key

with open(args.modulation_file, "rt") as f:
    par_data = json.load(f)[param_key]
param = {}
for d in par_data:
    param[d["param_name"]] = d["value"]
    
channels = np.unique(["_".join(x.split("_")[-2:]) for x in param.keys()])

# First pass: collect all channel data
channel_data = []
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
        
    conc = np.arange(0, half_activation*3, half_activation/100)
    modulation = mod_min + np.divide((mod_max-mod_min) * np.power(conc, hill_coefficient),
                                     (np.power(conc, hill_coefficient) + np.power(half_activation, hill_coefficient)))
    channel_data.append({'name': chan, 'conc': conc, 'modulation': modulation})

# Detect overlapping lines by checking if modulation values are similar
def lines_overlap(mod1, mod2, threshold=0.05):
    """Check if two modulation curves overlap significantly"""
    # Calculate the mean absolute difference
    diff = np.mean(np.abs(mod1 - mod2))
    return diff < threshold

# Find groups of overlapping channels
overlap_groups = []
processed = set()

for i, data1 in enumerate(channel_data):
    if data1['name'] in processed:
        continue
    
    group = [i]
    for j, data2 in enumerate(channel_data):
        if i != j and data2['name'] not in processed:
            # Interpolate to same concentration points for comparison
            mod2_interp = np.interp(data1['conc'], data2['conc'], data2['modulation'])
            if lines_overlap(data1['modulation'], mod2_interp):
                group.append(j)
                processed.add(data2['name'])
    
    if len(group) > 1:
        overlap_groups.append(group)
        for idx in group:
            processed.add(channel_data[idx]['name'])

# Custom color palette (skipping the bright white/cream color '#f6e8c3')
colors = [
    '#8c510a',  # dark brown
    '#bf812d',  # brown
    '#dfc27d',  # tan
    '#c7eae5',  # light cyan
    '#80cdc1',  # cyan
    '#35978f',  # teal
    '#01665e',  # dark teal
]

# Plotting with special treatment for overlapping lines
plt.figure(figsize=(8, 6))

# Style options for overlapping lines
overlap_styles = [
    {'linestyle': '-', 'linewidth': 4.5, 'alpha': 0.7},  # Solid, thick, slightly transparent
    {'linestyle': '--', 'linewidth': 3, 'alpha': 1.0},    # Dashed, medium
    {'linestyle': '-.', 'linewidth': 3, 'alpha': 1.0},    # Dash-dot, medium
    {'linestyle': ':', 'linewidth': 4, 'alpha': 1.0},     # Dotted, thick
]

# Track which channels are in overlap groups
overlap_channel_indices = set()
for group in overlap_groups:
    overlap_channel_indices.update(group)

# Plot all lines
for idx, data in enumerate(channel_data):
    color = colors[idx % len(colors)]
    
    if idx in overlap_channel_indices:
        # Find which group this channel belongs to
        group_idx = None
        position_in_group = None
        for g_idx, group in enumerate(overlap_groups):
            if idx in group:
                group_idx = g_idx
                position_in_group = group.index(idx)
                break
        
        # Apply special styling
        style = overlap_styles[position_in_group % len(overlap_styles)]
        plt.plot(data['conc']*1e6, data['modulation'], 
                label=data['name'], 
                color=color,
                linestyle=style['linestyle'],
                linewidth=style['linewidth'],
                alpha=style['alpha'])
    else:
        # Normal styling for non-overlapping lines
        plt.plot(data['conc']*1e6, data['modulation'], 
                label=data['name'],
                color=color,
                linewidth=2.5)

plt.xlabel("Concentration (nM)", size=24)
plt.ylabel("Modulation", size=24)
plt.xticks(fontsize=18)
plt.yticks(fontsize=18)
ax = plt.gca()
ax.xaxis.set_major_locator(plt.MaxNLocator(5))
y_tick_spacing = 0.25
ax.yaxis.set_major_locator(MultipleLocator(y_tick_spacing))
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.title("Modulation", size=30)
plt.legend(loc="center left", bbox_to_anchor=(1, 0.5), fontsize=16)
plt.tight_layout()
plt.savefig(f"ion_channel_modulation_curves.pdf")
plt.ion()
plt.show()
input("Press a key")
