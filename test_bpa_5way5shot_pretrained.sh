#!/bin/bash
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
source ~/anaconda3/etc/profile.d/conda.sh
conda activate rkb
cd /home/rmedu-4090/rkb/BPA

python3 train.py \
  --eval true \
  --method pt_map_bpa \
  --backbone wrn \
  --dataset miniimagenet \
  --data_path ./datasets/few_shot/miniimagenet \
  --num_shot 5 \
  --train_way 5 \
  --val_way 5 \
  --num_query 15 \
  --test_episodes 2000 \
  --eval_episodes 400 \
  --sink_iters 20 \
  --distance_metric cosine \
  --ot_reg 0.1 \
  --lr 5e-5 \
  --scheduler step \
  --step_size 5 \
  --gamma 0.5 \
  --weight_decay 0.0001 \
  --dropout 0.0 \
  --max_scale True \
  --mask_diag True \
  --pretrained_path ./checkpoints/miniimagenet/WideResNet28_10_S2M2_R/470.tar

