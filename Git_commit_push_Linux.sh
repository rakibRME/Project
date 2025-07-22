#!/bin/bash

cd /home/rmedu-4090/rkb/BPA || exit

# Pull latest changes to avoid conflicts
git pull origin main --rebase

# Track all changes including deletions
git add -A

# Get today's date
date=$(date +%F)

# Ask user for commit message
read -p "Enter today's work summary: " msg

# Commit with date + message
git commit -m "$date: $msg"

# Push to GitHub
git push origin main
