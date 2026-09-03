import argparse
import json
from pathlib import Path

parser = argparse.ArgumentParser(
    description="Generate benchmark JSON config files."
)
parser.add_argument("file_path", type=Path, help="Path to base JSON file")
args = parser.parse_args()

# Create sim_config directory alongside the base file
out_dir = args.file_path.parent / "sim_config"
out_dir.mkdir(exist_ok=True)

with open(args.file_path, "r", encoding="utf-8") as f:
    data = json.load(f)

original_output = data["output_file"]

for ctr in [1, 2, 4, 8, 16, 32, 64, 128]:
    data["output_file"] = original_output.replace(".hdf5", f"-{ctr}.hdf5")
    output_path = out_dir / f"{args.file_path.stem}-{ctr}{args.file_path.suffix}"

    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)

    print(f"Created: {output_path}")
