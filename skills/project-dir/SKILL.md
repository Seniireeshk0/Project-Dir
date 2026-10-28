---
name: project-dir
description: View, choose, or change the Antigravity projects root folder, open the folder selection dialog, or list all project subdirectories. Triggered by the /project-dir slash command.
---

# Project Directory Manager (`/project-dir`)

Use this skill whenever the user calls `/project-dir` or on the first run when the user has not yet selected where to save their projects.

## First-Run Behavior
- **Always ask the user first!** Never silently pick a default directory.
- Check `C:\Users\arsen\.gemini\config\workspace_settings.json`.
- If not configured, prompt the user with interactive options:
  1. Open the visual Windows folder picker dialog (`project_dir.ps1 -PickGui`).
  2. Enter a custom path manually.
  3. Choose one of the suggested paths.

## Common Workflows

### 1. Launch Visual Windows Folder Picker
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -PickGui
```

### 2. Set Custom Path
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -SetRoot "<Path>"
```

### 3. Check Current Root & List Projects
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -ListProjects
```

### 4. Create New Project Subfolder
```powershell
powershell -ExecutionPolicy Bypass -File "scripts/project_dir.ps1" -NewProject "<ProjectName>"
```
