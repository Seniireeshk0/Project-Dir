# Project-Dir

> A global directory & project organizer for Google Antigravity. Automatically routes every task into its own dedicated folder under your chosen root directory with instant `/project-dir` slash command control.

---

## ⚡ What is Project-Dir?

By default, agentic assistants often dump generated files into generic scratch folders or scatter them across your system. **Project-Dir** fixes this permanently:

- ❓ **Mandatory First-Run Prompt**: The AI **never assumes or hardcodes** a directory. Immediately after installation or on the first run, Antigravity **asks the user** where they want to store and group their projects!
- 🖥️ **Native Windows GUI Picker**: Pop up a standard visual folder browser dialog to select any folder on any drive with a single click.
- 📁 **Strict Project Isolation**: Every task, app, script, or experiment automatically gets its own isolated subdirectory (`src/`, `docs/`, `scripts/`, `README.md`).
- ⚡ **Instant Slash Command (`/project-dir`)**: Inspect current paths, switch directories, list existing projects, or reopen the folder picker directly from chat.
- 🛠️ **CLI Utilities**: Includes PowerShell (`project_dir.ps1`) and Python (`project_dir.py`) tools.

---

## 📁 Repository Structure

```text
Project-Dir/
├── .gitignore
├── LICENSE
├── README.md
├── plugin.json
├── rules/
│   └── AGENTS.md
├── skills/
│   └── project-dir/
│       └── SKILL.md
└── scripts/
    ├── project_dir.ps1
    └── project_dir.py
```

---

## 🚀 How to Use

### 1. In Antigravity Chat
Type:
```text
/project-dir
```
Antigravity will:
- Check if a root folder has been selected. If not, it prompts you immediately.
- Display your active root folder.
- Allow you to open the Windows visual folder dialog or set a new path.
- List all projects inside your root folder.

### 2. From PowerShell (Terminal)
```powershell
# Open native Windows visual folder picker dialog:
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -PickGui

# Set root directory directly:
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -SetRoot "C:\Antigravity"

# List all projects:
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -ListProjects

# Scaffold a new project subfolder:
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -NewProject "my-new-project"
```

### 3. From Python
```bash
# Print active root directory:
python scripts/project_dir.py --get-root

# Set root directory:
python scripts/project_dir.py --set-root "C:\Antigravity"

# List projects:
python scripts/project_dir.py --list-projects

# Scaffold a new project:
python scripts/project_dir.py --new-project "my-new-project"
```

---

## 📥 Installation

1. Clone or download this repository.
2. Place the folder into your Antigravity global plugins directory:
   ```text
   C:\Users\<YourUser>\.gemini\config\plugins\project-dir\
   ```
3. Enable it in `~/.gemini/config/config.json`:
   ```json
   {
     "plugins": {
       "project-dir": {
         "enabled": true
       }
     }
   }
   ```
4. Type `/project-dir` in Antigravity to get started!

---

## 📄 License
MIT License. Free to use, modify, and distribute.
