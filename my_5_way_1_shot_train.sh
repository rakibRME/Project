#!/bin/bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb
cd /home/rmedu-4090/rkb/BPA

python3 train.py \
  --method pt_map_bpa \
  --backbone wrn \
  --data_path ./datasets/few_shot/miniimagenet \
  --sink_iters 5 \
  --distance_metric cosine \
  --ot_reg 0.2 \
  --augment false \
  --lr 5e-5 \
  --weight_decay 0. \
  --max_epochs 50 \
  --train_way 5 \
  --val_way 5 \
  --num_shot 1 \
  --num_query 10 \
  --train_episodes 200 \
  --eval_episodes 400 \
  --num_workers 2 \
  --checkpoint_dir ./checkpoints/miniimagenet/wrn/pt_map_bpa/run_1shot_augFalse


