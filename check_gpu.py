import torch

print("🧠 PyTorch version:", torch.__version__)
print("🔍 CUDA available:", torch.cuda.is_available())

if torch.cuda.is_available():
    print("✅ GPU detected!")
    print("🖥️ GPU name:", torch.cuda.get_device_name(0))
    print("💾 Memory allocated:", round(torch.cuda.memory_allocated(0) / 1024**2, 2), "MB")
    print("💾 Memory reserved:", round(torch.cuda.memory_reserved(0) / 1024**2, 2), "MB")
else:
    print("❌ GPU not detected or not usable by PyTorch.")
