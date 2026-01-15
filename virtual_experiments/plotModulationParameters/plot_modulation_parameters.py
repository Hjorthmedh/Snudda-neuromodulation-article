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

plt.figure(figsize=(8, 6))

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


    plt.plot(conc*1e6, modulation, label=chan)

plt.xlabel("Concentration (nM)", size=20)
plt.ylabel("Modulation", size=20)
plt.xticks(fontsize=18)
plt.yticks(fontsize=18)

ax = plt.gca()
ax.xaxis.set_major_locator(plt.MaxNLocator(5))
y_tick_spacing = 0.25
ax.yaxis.set_major_locator(MultipleLocator(y_tick_spacing))

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

plt.title("Modulation", size=30)
# plt.legend(loc="best", fontsize=18)
plt.legend(loc="center left", bbox_to_anchor=(1, 0.5), fontsize=16)

plt.tight_layout()
plt.savefig(f"ion_channel_modulation_curves.pdf")

plt.ion()
plt.show()



input("Press a key")
