#!/bin/bash

# ✅ Go to your project directory
cd /home/rmedu-4090/rkb/BPA || { echo "❌ Project directory not found."; exit 1; }

# ✅ Pull latest changes from GitHub
echo "📥 Pulling from GitHub..."
git pull origin main --rebase || { echo "❌ Pull failed. Resolve conflicts first."; exit 1; }

# ✅ Add all remaining local changes
echo "📂 Staging all local changes..."
git add -A

# ✅ Get today's date
date=$(date +%F)

# ✅ Prompt for commit message
read -p "📝 Enter your commit message: " msg

# ✅ Commit (skip if nothing to commit)
git diff --cached --quiet
if [ $? -eq 0 ]; then
    echo "⚠️ Nothing to commit."
else
    git commit -m "$date: $msg"
fi

# ✅ Push to GitHub
echo "🚀 Pushing to GitHub..."
git push origin main && echo "✅ Push successful!" || echo "❌ Push failed."

