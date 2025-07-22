#!/bin/bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb
cd /home/rmedu-4090/rkb/BPA

python3 train.py \
  --method pt_map_bpa \
  --backbone wrn \
  --dataset miniimagenet \
  --data_path ./datasets/few_shot/miniimagenet \
  --num_shot 1 \
  --train_way 5 \
  --val_way 5 \
  --num_query 15 \
  --train_episodes 200 \
  --eval_episodes 400 \
  --test_episodes 10000 \
  --sink_iters 5 \
  --distance_metric cosine \
  --ot_reg 0.2 \
  --lr 5e-5 \
  --scheduler step \
  --step_size 5 \
  --gamma 0.5 \
  --weight_decay 0.0 \
  --dropout 0.0 \
  --max_scale True \
  --mask_diag True \
  --augment false \
  --max_epochs 50 \
  --num_workers 2 \
  --pretrained_path ./checkpoints/miniimagenet/WideResNet28_10_S2M2_R/470.tar \
  --checkpoint_dir ./checkpoints/miniimagenet/wrn/pt_map_bpa/run_1shot_augFalse_pretrained
