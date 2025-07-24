#!/bin/bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb
cd /home/rmedu-4090/rkb/BPA

python3 train.py \
  --eval true \
  --method pt_map_bpa \
  --backbone wrn \
  --data_path ./datasets/few_shot/miniimagenet \
  --num_shot 5 \
  --train_way 5 \
  --val_way 5 \
  --num_query 15 \
  --test_episodes 2000 \
--checkpoint_dir ./checkpoints/miniimagenet/wrn/pt_map_bpa/run_5shot_augFalse_metrics \
--pretrained_path ./checkpoints/miniimagenet/wrn/pt_map_bpa/run_5shot_augFalse_metrics/max_acc.pth
