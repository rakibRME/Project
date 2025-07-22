@echo off
cd /d H:\University\4-1\RME-4100\MY_CODE\BPA
python train.py --eval True --test_episodes 100 --pretrained_path "./checkpoints/miniimagenet/wrn/pt_map_bpa/-n_way=5-n_shot=3-lr=5e-05-scheduler=step-dropout=0.0/max_acc.pth"
pause
