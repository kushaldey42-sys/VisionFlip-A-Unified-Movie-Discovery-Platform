# Push to GitHub - 19-Feb-2026

Your repo: **https://github.com/kushaldey42-sys/19-Feb-2026**

## Option 1: Run the batch file (easiest)

1. Double-click **`push-to-github.bat`** in this folder.
2. If prompted, sign in to GitHub (browser or credential manager).
3. Done.

---

## Option 2: Run commands manually

Open **Command Prompt** or **PowerShell** in this folder and run:

```bash
# Initialize git (if first time)
git init

# Add your GitHub repo as remote
git remote add origin https://github.com/kushaldey42-sys/19-Feb-2026.git

# If remote already exists, update it:
# git remote set-url origin https://github.com/kushaldey42-sys/19-Feb-2026.git

# Add all files (node_modules and .env are ignored)
git add .

# Commit
git commit -m "Netflix-style Movie App - Full stack with auth, OMDB, favorites"

# Push to main branch
git branch -M main
git push -u origin main
```

---

## Notes

- **`.env`** and **`node_modules`** are not pushed (in `.gitignore`).
- Add `server/.env.example` to the repo so others know what env vars to set.
- If push asks for credentials, use your GitHub username and a **Personal Access Token** (not password) at: https://github.com/settings/tokens
