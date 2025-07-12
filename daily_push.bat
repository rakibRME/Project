@echo off
cd /d H:\University\4-1\RME-4100\MY_CODE\BPA
git add .
set /p msg=Enter commit message:
git commit -m "%msg%"
git push
