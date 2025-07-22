@echo off
cd /d %~dp0

:: Try pulling latest changes
echo Pulling from origin/main...
git pull origin main --rebase
if errorlevel 1 (
    echo ⚠️ Pull failed. Please resolve conflicts or stash local changes.
    pause
    exit /b
)

:: Add all changes
git add -A

:: Get today's date
for /f %%i in ('powershell -command "Get-Date -Format yyyy-MM-dd"') do set date=%%i

:: Get commit message
set /p msg=Enter today's work summary: 

:: Commit
git commit -m "%date%: %msg%"

:: Push
git push origin main
echo ✅ All done!
pause
