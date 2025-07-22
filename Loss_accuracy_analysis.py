import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# CSV ফাইলের path দিন (প্রয়োজনে আপডেট করুন)
csv_path = "/home/rmedu-4090/rkb/BPA/checkpoints/miniimagenet/wrn/pt_map_bpa/-n_way=5-n_shot=5-lr=5e-05-scheduler=step-dropout=0.0-37-12-72-9-75/metrics.csv"

# CSV ফাইল লোড করুন
df = pd.read_csv(csv_path)

# Seaborn style
sns.set(style="whitegrid")

# গ্রাফ আঁকার জন্য plot layout তৈরি
fig, axs = plt.subplots(2, 1, figsize=(10, 8))

# 🎯 Accuracy vs Epoch
axs[0].plot(df["epoch"], df["train_acc"], label="Train Accuracy", marker='o')
axs[0].plot(df["epoch"], df["val_acc"], label="Validation Accuracy", marker='x')
axs[0].set_title("Accuracy vs Epoch")
axs[0].set_xlabel("Epoch")
axs[0].set_ylabel("Accuracy")
axs[0].legend()
axs[0].grid(True)

# 📉 Loss vs Epoch
axs[1].plot(df["epoch"], df["train_loss"], label="Train Loss", marker='o')
axs[1].plot(df["epoch"], df["val_loss"], label="Validation Loss", marker='x')
axs[1].set_title("Loss vs Epoch")
axs[1].set_xlabel("Epoch")
axs[1].set_ylabel("Loss")
axs[1].legend()
axs[1].grid(True)

plt.tight_layout()
plt.show()
