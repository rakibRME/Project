import os
import shutil

# তোমার 100টি ক্লাস ফোল্ডার যেখানে আছে
source_root = r"H:\University\4-1\RME-4100\MY_DATASETS\miniimagenet"

# BPA প্রজেক্টের target images folder
target_dir = r"H:\University\4-1\RME-4100\MY_CODE\BPA\data\miniimagenet\images"

# লক্ষ্য ফোল্ডার তৈরি (না থাকলে)
os.makedirs(target_dir, exist_ok=True)

total_copied = 0

for class_name in os.listdir(source_root):
    class_path = os.path.join(source_root, class_name)

    if os.path.isdir(class_path):
        for idx, img_file in enumerate(os.listdir(class_path)):
            if img_file.lower().endswith(('.jpg', '.jpeg', '.png')):
                src = os.path.join(class_path, img_file)
                new_name = f"{class_name}_{idx}.JPEG"
                dst = os.path.join(target_dir, new_name)

                try:
                    shutil.copy2(src, dst)
                    total_copied += 1
                    print(f"✅ Copied: {src} → {dst}")
                except Exception as e:
                    print(f"❌ Failed: {src} → {e}")

print(f"\n🎉 Done! Total images copied: {total_copied}")
