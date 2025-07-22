@echo off
cd /d %~dp0

:: Pull latest changes to avoid conflicts
echo Pulling from origin/main...
git pull origin main --rebase

:: Stage all changes (including deletions)
echo Adding all changes...
git add -A

:: Get today's date (YYYY-MM-DD format)
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd"') do set date=%%i

:: Prompt for commit message
set /p msg=Enter today's work summary: 

:: Create commit with date and message
git commit -m "%date%: %msg%"

:: Push to GitHub
echo Pushing to GitHub...
git push origin main

echo.
echo ✅ All done!
pause
