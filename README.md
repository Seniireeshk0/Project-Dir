# Project-Dir

> A global workspace & project organizer for Google Antigravity. Automatically isolates every coding task into its own structured project directory under a customizable root folder.

---

## ⚡ What is Project-Dir?

By default, agentic assistants often scatter generated files across temporary scratchpads or arbitrary system folders. **Project-Dir** fixes this permanently:

- 🎯 **Centralized Root Directory**: Choose any folder (e.g. `C:\Antigravity` or `D:\Projects`) where all your work lives.
- 📁 **Strict Project Isolation**: Every task, app, or script automatically gets its own structured subfolder (`src/`, `docs/`, `scripts/`, `README.md`).
- ⚡ **Instant Slash Command (`/project-dir`)**: Inspect current paths, switch directories, list existing projects, or open a visual Windows folder picker dialog directly from chat.
- 🛠️ **CLI & GUI Automation**: Includes PowerShell (`workspace_tool.ps1`) and Python (`workspace_tool.py`) tools with native Windows folder selection dialogs.

---

## 📦 What's Included

- `plugin.json` — Antigravity plugin manifest.
- `rules/AGENTS.md` — Global rules that enforce folder isolation for every task.
- `skills/project-dir/SKILL.md` — The `/project-dir` slash command definition.
- `scripts/workspace_tool.ps1` — PowerShell utility with a native Windows folder browser GUI (`-PickGui`).
- `scripts/workspace_tool.py` — Cross-platform Python CLI utility.

---

## 🚀 Usage

### 1. In Antigravity Chat
Type the slash command:
```text
/project-dir
```
Antigravity will:
1. Show your currently configured project directory.
2. List all existing projects inside it.
3. Allow you to change directories or open a Windows folder selection window.

### 2. From Terminal (PowerShell)
```powershell
# Open native Windows folder picker dialog:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -PickGui

# Set root directory directly:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -SetRoot "C:\Antigravity"

# List all projects:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -ListProjects

# Scaffold a new project subfolder:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -NewProject "my-app"
```

### 3. From Terminal (Python)
```bash
# Print active projects root:
python scripts/workspace_tool.py --get-root

# Set root directory:
python scripts/workspace_tool.py --set-root "C:\Antigravity"

# List projects:
python scripts/workspace_tool.py --list-projects
```

---

## 📥 Installation

1. Download [`Project-Dir.zip`](Project-dir.zip) from this repository.
2. Extract it into your Antigravity global plugins directory:
   ```text
   C:\Users\<YourUser>\.gemini\config\plugins\Project-Dir\
   ```
3. Enable it in `~/.gemini/config/config.json`:
   ```json
   {
     "plugins": {
       "Project-Dir": {
         "enabled": true
       }
     }
   }
   ```
4. Type `/project-dir` in Antigravity to get started!

---

## 📄 License
MIT License. Free to use, modify, and distribute.
