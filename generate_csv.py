import os
import csv
import random

# Image folder
images_folder = r"H:\University\4-1\RME-4100\MY_CODE\BPA\data\miniimagenet\images"
output_folder = r"H:\University\4-1\RME-4100\MY_CODE\BPA\data\miniimagenet"

# Extract class names from filenames
class_images = {}

for filename in os.listdir(images_folder):
    if filename.endswith(".JPEG"):
        class_name = filename.split("_")[0]
        class_images.setdefault(class_name, []).append(filename)

# Shuffle & split: 60% train, 20% val, 20% test
train_rows, val_rows, test_rows = [], [], []

for cls, files in class_images.items():
    random.shuffle(files)
    total = len(files)
    n_train = int(0.6 * total)
    n_val = int(0.2 * total)

    for f in files[:n_train]:
        train_rows.append([f, cls])
    for f in files[n_train:n_train + n_val]:
        val_rows.append([f, cls])
    for f in files[n_train + n_val:]:
        test_rows.append([f, cls])

# Write CSVs
for name, rows in [('train.csv', train_rows), ('val.csv', val_rows), ('test.csv', test_rows)]:
    with open(os.path.join(output_folder, name), 'w', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(['id', 'label'])
        writer.writerows(rows)

print("✅ CSV files generated!")
