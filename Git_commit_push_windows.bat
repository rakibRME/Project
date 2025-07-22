@echo off
cd /d %~dp0

:: Pull latest changes first to avoid conflicts
git pull origin main --rebase

:: Track all changes including deletions
git add -A

:: Get today's date
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd"') do set date=%%i

:: Ask user for commit message
set /p msg=Enter today's work summary: 

:: Commit with date + message
git commit -m "%date%: %msg%"

:: Push to GitHub
git push origin main

pause
