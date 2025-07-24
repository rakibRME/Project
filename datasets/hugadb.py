import os
import pandas as pd
from PIL import Image
from torch.utils.data import Dataset
from torchvision import transforms


class HuGaDB(Dataset):
    def __init__(self, data_path, setname, model_name, augment=False):
        self.data_path = data_path
        self.setname = setname.lower()  # 'train', 'val', or 'test'
        self.augment = augment

        # Load CSV
        csv_path = os.path.join(data_path, 'split', f'{self.setname}.csv')
        df = pd.read_csv(csv_path)
        self.image_paths = df['id'].tolist()
        self.labels = df['label'].tolist()

        # Make label to index mapping
        self.label2idx = {label: idx for idx, label in enumerate(sorted(set(self.labels)))}
        self.label = [self.label2idx[l] for l in self.labels]

        # Image size (resize if needed for model)
        self.image_size = 84  # Default used by MiniImageNet

        # Transforms
        self.transform = self.get_transform(model_name)

        # ✅ Debug class count
        print(f"[DEBUG] HuGaDB ({self.setname}) has {len(set(self.label))} unique classes.")


    def __getitem__(self, idx):
        image_path = os.path.join(self.data_path, 'images', self.image_paths[idx])
        image = Image.open(image_path).convert('RGB')
        image = self.transform(image)
        label = self.label[idx]
        return image, label

    def __len__(self):
        return len(self.image_paths)

    def get_transform(self, model_name):
        normalize = transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                         std=[0.229, 0.224, 0.225])
        if self.augment:
            return transforms.Compose([
                transforms.RandomResizedCrop(self.image_size),
                transforms.RandomHorizontalFlip(),
                transforms.ToTensor(),
                normalize
            ])
        else:
            return transforms.Compose([
                transforms.Resize([self.image_size, self.image_size]),
                transforms.ToTensor(),
                normalize
            ])
