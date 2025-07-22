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
  --train_way 10 \
  --val_way 5 \
  --num_shot 5 \
  --num_query 13 \
  --train_episodes 200 \
  --eval_episodes 400 \
  --max_epochs 50 \
  --lr 5e-5 \
  --optimizer adam \
  --weight_decay 0.0 \
  --momentum 0.9 \
  --scheduler step \
  --step_size 5 \
  --gamma 0.5 \
  --ot_reg 0.2 \
  --dropout 0.0 \
  --augment false \
  --sink_iters 5 \
  --distance_metric cosine \
  --mask_diag True \
  --max_scale True \
  --pretrained_path ./checkpoints/miniimagenet/WideResNet28_10_S2M2_R/470.tar \
  --checkpoint_dir ./checkpoints/miniimagenet/wrn/pt_map_bpa/run_5shot_augFalse_pretrained \
  --num_workers 0

