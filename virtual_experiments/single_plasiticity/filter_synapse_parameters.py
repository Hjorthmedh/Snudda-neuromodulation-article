import json

input_file = "../../snudda_data/synapses/striatum/M1RH_Analysis_190925.h5-parameters-MS.json"
output_file = "../../data/JSON/synapse-param-stripped.json"

print(f"Opening : {input_file}")
with open(input_file, "r", encoding="utf-8") as f:
    data = json.load(f)

filtered = {}

for key, value in data.items():
    synapse = value.get("synapse", None)
    
    if synapse is not None:
        filtered[key] = {
            "synapse": synapse
        }
    else:
        # optionally keep empty or skip entirely
        filtered[key] = {}

print(f"Writing {output_file}")        
with open(output_file, "w", encoding="utf-8") as f:
    json.dump(filtered, f, indent=4)
