#!/bin/bash

cd /home/rmedu-4090/rkb/BPA || exit

git pull origin main --rebase
git add -A

date=$(date +%F)
read -p "Enter commit message: " msg
git commit -m "$date: $msg"

git push origin main

