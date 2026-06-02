import json

input_file = "../../data/JSON/synapse-param-stripped.json"
output_file = "../../data/JSON/synapse-param-plasticity.json"

PARAMS = {

    "ltp_decay_tau": 10000000,
    "ltp_onset_tau": 10000,
    "ltp_psub_threshold": 0.0003,
    "ltp_max": 1.25,

    "mod_da_g_ampa_min": 1,
    "mod_da_g_ampa_max": 1.25,
    "mod_da_g_ampa_half": 400e-6,
    "mod_da_g_ampa_hill": 4,

    "mod_da_g_nmda_min": 1,
    "mod_da_g_nmda_max": 1.25,
    "mod_da_g_nmda_half": 400e-6,
    "mod_da_g_nmda_hill": 4
}

def enrich_synapse(syn):
    for k, v in PARAMS.items():
        syn[k] = v
    return syn

with open(input_file, "r", encoding="utf-8") as f:
    data = json.load(f)

for key, entry in data.items():
    if "synapse" not in entry:
        entry["synapse"] = {}

    entry["synapse"] = enrich_synapse(entry["synapse"])

with open(output_file, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)

print("Done ->", output_file)
