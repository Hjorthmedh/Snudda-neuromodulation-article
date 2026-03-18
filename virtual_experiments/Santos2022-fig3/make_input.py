import os
import csv

# Internal parameters
num_files = 10
num_rows = 1  # 10
offset_start = -4  # can change
base_start = 5     # starting number for offset 0
base_end = 6       # ending number for offset 0
step = 0.1         # increment per column

os.makedirs("input", exist_ok=True)

for i in range(num_files):
    offset = offset_start + i
    # generate a single row
    row = [round(base_start + offset + j*step, 1) for j in range(int((base_end-base_start)/step) + 1)]
    # write file
    with open(f"input/input-{offset}.csv", "w", newline="") as f:
        writer = csv.writer(f)
        for _ in range(num_rows):
            writer.writerow(row)
