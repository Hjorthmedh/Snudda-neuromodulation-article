import json

input_file = "../../data/JSON/synapse-param-stripped.json"
output_file = "../../data/JSON/synapse-param-plasticity.json"

# --------------------------------------------------
# FLAT PARAMETER VALUES (FINAL KEYS EXACTLY AS USED)
# --------------------------------------------------
PARAMS = {
    "mod_psub_fail_min": 1,
    "mod_psub_fail_max": 1.25,
    "mod_psub_fail_half": 0.0007,
    "mod_psub_fail_hill": 4,

    "mod_psub_g_ampa_min": 1,
    "mod_psub_g_ampa_max": 1.25,
    "mod_psub_g_ampa_half": 0.0007,
    "mod_psub_g_ampa_hill": 4,

    "mod_da_g_ampa_min": 1,
    "mod_da_g_ampa_max": 1.25,
    "mod_da_g_ampa_half": 300e-6,
    "mod_da_g_ampa_hill": 4,

    "mod_da_g_nmda_min": 1,
    "mod_da_g_nmda_max": 1.25,
    "mod_da_g_nmda_half": 300e-6,
    "mod_da_g_nmda_hill": 4
}

# --------------------------------------------------
# ENRICH SYNAPSE BLOCK
# --------------------------------------------------
def enrich_synapse(syn):
    for k, v in PARAMS.items():
        syn[k] = v
    return syn

# --------------------------------------------------
# LOAD DATA
# --------------------------------------------------
with open(input_file, "r", encoding="utf-8") as f:
    data = json.load(f)

# --------------------------------------------------
# APPLY TO ALL ENTRIES
# --------------------------------------------------
for key, entry in data.items():
    if "synapse" not in entry:
        entry["synapse"] = {}

    entry["synapse"] = enrich_synapse(entry["synapse"])

# --------------------------------------------------
# SAVE OUTPUT
# --------------------------------------------------
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4)

print("Done ->", output_file)
