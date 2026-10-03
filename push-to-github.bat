@echo off
echo Pushing Netflix Project to GitHub...
cd /d "%~dp0"

if not exist .git (
    echo Initializing git repository...
    git init
)

echo Setting remote to your GitHub repo...
git remote remove origin 2>nul
git remote add origin https://github.com/kushaldey42-sys/19-Feb-2026.git

echo Adding files...
git add .

echo Committing...
git commit -m "Netflix-style Movie App - Full stack with auth, OMDB, favorites" 2>nul || git commit -m "Initial commit - Netflix Movie App"

echo Pushing to GitHub...
git branch -M main
git push -u origin main

echo Done!
pause
