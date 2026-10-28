Project-Dir

A global directory & project organizer for Google Antigravity. Automatically routes every task into its own dedicated folder under your chosen root directory with instant /project-dir slash command control.

⚡ What is Project-Dir?

By default, agentic assistants often dump generated files into generic scratch folders or scatter them across your system. Project-Dir fixes this permanently:

Centralized Root Folder: Choose any master folder (e.g. C:\Antigravity or D:\Projects) where all your work lives.
Dedicated Project Folders: Every task, app, script, or experiment automatically gets its own isolated subdirectory (src/, docs/, scripts/, README.md).
Instant Slash Command (/project-dir): Inspect current paths, switch directories, list existing projects, or launch a visual Windows folder picker dialog directly from chat.
Interactive CLI & GUI: Built-in PowerShell and Python tools with native Windows folder selection dialogs.
📁 Repository Structure
text
Project-Dir/
├── plugin.json                 # Antigravity plugin manifest
├── README.md                   # Documentation & guide
├── rules/
│   └── AGENTS.md               # Global agent enforcement rules
├── skills/
│   ├── project-dir/
│   │   └── SKILL.md            # /project-dir slash command definition
│   └── workspace-manager/
│       └── SKILL.md            # Extended directory management workflows
└── scripts/
    ├── workspace_tool.ps1      # PowerShell tool with Windows GUI picker
    └── workspace_tool.py       # Python CLI utility
🚀 How to Use
1. In Antigravity Chat

Simply type:

text
/project-dir

Antigravity will:

Display your active root folder (e.g. C:\Antigravity).
List existing project folders.
Allow you to change directories or launch a native Windows folder picker with one click.
2. From PowerShell (Terminal)
powershell
# Open native Windows visual folder picker dialog:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -PickGui
# Set root directory directly:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -SetRoot "C:\Antigravity"
# List all projects:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -ListProjects
# Scaffold a new project subfolder:
powershell -ExecutionPolicy Bypass -File "scripts/workspace_tool.ps1" -NewProject "my-new-project"
3. From Python
bash
# Print active root directory:
python scripts/workspace_tool.py --get-root
# Set root directory:
python scripts/workspace_tool.py --set-root "C:\Antigravity"
# List projects:
python scripts/workspace_tool.py --list-projects
# Scaffold a new project:
python scripts/workspace_tool.py --new-project "my-new-project"
📥 Installation
Clone or download this repository.
Place the folder into your Antigravity global plugins directory:
text
C:\Users\<YourUser>\.gemini\config\plugins\Project-Dir\
Enable it in your ~/.gemini/config/config.json:
json
{
  "plugins": {
    "Project-Dir": {
      "enabled": true
    }
  }
}
Type /project-dir in Antigravity to get started!
📄 License

MIT License. Free to use, modify, and distribute.
