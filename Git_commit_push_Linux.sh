#!/bin/bash

cd /home/rmedu-4090/rkb/BPA || { echo "❌ Directory not found. Exiting."; exit 1; }

echo "📥 Pulling latest changes from origin/main..."
git pull origin main --rebase || { echo "❌ Pull failed. Resolve conflicts and try again."; exit 1; }

echo "📂 Staging all changes..."
git add -A

date=$(date +%F)
read -p "📝 Enter today's work summary: " msg

if [ -z "$msg" ]; then
  echo "⚠️  Commit message cannot be empty. Exiting."
  exit 1
fi

echo "✅ Committing changes..."
git commit -m "$date: $msg"

echo "🚀 Pushing to GitHub..."
git push origin main || { echo "❌ Push failed. Check your network or credentials."; exit 1; }

echo "✅ All done!"
