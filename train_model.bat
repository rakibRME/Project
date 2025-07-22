@echo off
cd /d H:\University\4-1\RME-4100\MY_CODE\BPA
python train.py --train_episodes 1 --max_epochs 1 --num_shot 5 --num_query 1 --augment True
pause
