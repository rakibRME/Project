@echo off
cd /d H:\University\4-1\RME-4100\MY_CODE\BPA
git add .

:: Take date in YYYY-MM-DD format
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd"') do set date=%%i

:: Ask for commit note
set /p msg=Enter today’s work summary:

:: Combine date + message
git commit -m "%date%: %msg%"
git push
pause
