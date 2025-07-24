#!/bin/bash

# Ensure CUDA memory management is optimized
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

# Activate your conda environment
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb

# Navigate to the project directory
cd /home/rmedu-4090/rkb/BPA

# Run the training script with all parameters
python3 train.py \
  --dataset hugadb \
  --method pt_map_bpa \
  --backbone wrn \
  --data_path ./datasets/few_shot/HuGaDB \
  --sink_iters 5 \
  --distance_metric cosine \
  --ot_reg 0.2 \
  --augment false \
  --lr 5e-5 \
  --weight_decay 0.0 \
  --max_epochs 100 \
  --train_way 5 \
  --val_way 2 \
  --num_shot 1 \
  --num_query 10 \
  --eval_freq 1 \
  --eval_first true \
  --train_episodes 200 \
  --eval_episodes 1000 \
  --num_workers 2 \
  --checkpoint_dir ./checkpoints/HuGaDB/wrn/pt_map_bpa/run_1shot_augFalse

