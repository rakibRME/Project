#!/bin/bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb
cd /home/rmedu-4090/rkb/BPA

python3 train.py \
  --dataset hugadb \
  --eval true \
  --method pt_map_bpa \
  --backbone wrn \
  --data_path ./datasets/few_shot/HuGaDB \
  --num_shot 5 \
  --train_way 5 \
  --val_way 2 \
  --num_query 15 \
  --test_episodes 2000 \
  --checkpoint_dir ./checkpoints/HuGaDB/wrn/pt_map_bpa/run_1shot_augFalse \
  --pretrained_path ./checkpoints/HuGaDB/wrn/pt_map_bpa/run_1shot_augFalse/max_acc.pth

