#!/bin/bash

cd /home/rmedu-4090/rkb/BPA || { echo "❌ Project folder missing."; exit 1; }

# ✅ Auto-commit any unstaged changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "💾 Auto committing uncommitted changes..."
    git add -A
    git commit -m "Auto commit before pull"
fi

# ✅ Pull from GitHub
echo "📥 Pulling from GitHub..."
git pull origin main --rebase || { echo "❌ Pull failed. Resolve manually."; exit 1; }

# ✅ Stage all changes (again, for new work)
git add -A

# ✅ Take message and commit
date=$(date +%F)
read -p "📝 Enter your commit message: " msg
git commit -m "$date: $msg" || echo "⚠️ Nothing new to commit."

# ✅ Push
echo "🚀 Pushing to GitHub..."
git push origin main && echo "✅ Push done!" || echo "❌ Push failed."

