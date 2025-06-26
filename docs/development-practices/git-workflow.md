## 🧠 DexaMinds Git & GitHub Training Guide (Using Git Bash)

### 🔧 1. Initial Setup

#### ✅ Install Git
- Download from: https://git-scm.com/downloads

#### ✅ Configure Git
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@dexaminds.com"
git config --global core.editor "code --wait"  # Optional: Set VS Code as default editor
```

#### ✅ Verify Configuration
```bash
git config --list
```

---

### 📁 2. Repository Management

#### ✅ Clone a Repository
```bash
git clone https://github.com/your-org/repo-name.git
```

#### ✅ Create a New Repository (Local)
```bash
mkdir my-project
cd my-project
git init
```

#### ✅ Link to Remote Repository
```bash
git remote add origin https://github.com/your-org/repo-name.git
git push -u origin main
```

#### ❌ Delete a Local Repository
```bash
rm -rf my-project
```

---

### 🌿 3. Branching Operations

#### ✅ Create a New Branch
```bash
git checkout -b feature/branch-name
```

#### 🔁 Switch Between Branches
```bash
git checkout main
```

#### 🔀 Merge a Branch
```bash
git checkout main
git merge feature/branch-name
```

#### ❌ Delete a Branch
```bash
git branch -d feature/branch-name       # Safe delete
git branch -D feature/branch-name       # Force delete
```

---

### 🔁 4. Commit Workflow

This section outlines the **standard Git commit workflow** that every developer at DexaMinds should follow:

#### 🧭 Step-by-Step Commit Workflow

1. **Pull latest changes** from the remote branch:
   ```bash
   git pull origin branch-name
   ```

2. **Check status** of your working directory:
   ```bash
   git status
   ```

3. **Stage the changes** you want to commit:
   ```bash
   git add file-name         # Add specific file
   git add .                 # Add all changes
   ```

4. **Review staged changes** (optional but recommended):
   ```bash
   git diff --cached
   ```

5. **Commit with a meaningful message**:
   ```bash
   git commit -m "feat: add login validation for user form"
   ```

6. **Push your changes** to the remote branch:
   ```bash
   git push origin branch-name
   ```

7. **Create a Pull Request** on GitHub and request review.

---

### 🔍 5. Working with Pull Requests (PRs)

#### ✅ Create a PR
1. Push your branch to GitHub.
2. Go to GitHub → Open your repo → Click **"Compare & pull request"**.
3. Add title, description, reviewers, and submit.

#### ✅ Review a PR
- Use GitHub UI to comment, approve, or request changes.

#### ✅ Merge a PR
- After approval, click **"Merge pull request"** on GitHub.

---

### 🧪 6. Best Practices

- Use meaningful branch names: `feature/login-page`, `fix/api-error`
- Commit often with clear messages.
- Always pull before pushing.
- Delete merged branches to keep repo clean.
- Use `.gitignore` to avoid committing unnecessary files.

---
### 🛠️ Common Git Commands Cheat Sheet

| Action | Command |
|--------|---------|
| Initialize repo | `git init` |
| Clone repo | `git clone <url>` |
| Check status | `git status` |
| Stage file | `git add file-name` |
| Stage all | `git add .` |
| Unstage file | `git reset file-name` |
| Commit | `git commit -m "message"` |
| Amend last commit | `git commit --amend` |
| View commit history | `git log` |
| View one-line log | `git log --oneline` |
| Create branch | `git checkout -b branch-name` |
| Switch branch | `git checkout branch-name` |
| Delete branch | `git branch -d branch-name` |
| Merge branch | `git merge branch-name` |
| Pull changes | `git pull origin branch-name` |
| Push changes | `git push origin branch-name` |
| View remote | `git remote -v` |
| Add remote | `git remote add origin <url>` |
| Remove remote | `git remote remove origin` |

---
