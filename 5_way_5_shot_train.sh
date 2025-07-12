#!/bin/bash

# Step 1: Load conda and activate your environment
source /home/rme05/anaconda3/etc/profile.d/conda.sh
conda activate rkb

# Step 2: Go to your project folder
cd /home/rme05/rkb/BPA

# Step 3: Run training script
python train.py \
--method pt_map_bpa \
--dataset miniimagenet \
--data_path ./datasets/few_shot/miniimagenet \
--num_shot 5 \
--train_way 5 \
--val_way 5 \
--eval False \
--max_epochs 200 \
--train_episodes 100 \
--augment True \
--lr 3e-5 \
--weight_decay 0.00005 \
--scheduler step \
--step_size 10 \
--gamma 0.5 \
--dropout 0.1 \
--ot_reg 0.1 \
--mask_diag True \
--max_scale True \
--momentum 0.9 \
--num_workers 8
