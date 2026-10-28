# Project-Dir: Global Directory & Project Rules

These rules govern how files, projects, and deliverables are structured across all sessions in Antigravity:

## 1. MANDATORY FIRST-RUN SETUP (Always Ask the User!)
- **NEVER silently assume, guess, or hardcode a directory for the user.**
- Check `C:\Users\arsen\.gemini\config\workspace_settings.json`.
- If `workspace_settings.json` does not exist, or `projects_root` is empty, or `is_configured` is false/missing:
  - **The AI MUST IMMEDIATELY ASK THE USER** where they want to store and group all their Antigravity projects!
  - Provide clear options:
    1. **Open Windows visual folder picker dialog** (runs `project_dir.ps1 -PickGui` so user can browse and click any folder).
    2. **Enter a custom folder path** directly in chat.
    3. **Suggested default locations** on their system (e.g. `D:\Projects`, `C:\Projects`, `C:\Users\arsen\Projects`).
  - Do NOT create any project files until the user has selected or confirmed their preferred root folder.
  - Save the choice to `workspace_settings.json` with `"is_configured": true`.

## 2. Dedicated Folder Per Project (Strict Isolation)
- Once the root directory is set, **every distinct project, app, script suite, or task MUST have its own isolated subfolder**: `<projects_root>/<project-name>/`.
- **Never dump files into generic scratch** (`.gemini\antigravity\scratch`) or user home/desktop unless the user explicitly requested a temporary throwaway one-liner.
- Structure inside each project folder:
  - `src/` — Source code
  - `docs/` or `README.md` — Documentation & notes
  - `scripts/` — Helper scripts
  - `tests/` — Automated tests

## 3. Slash Command `/project-dir`
- If the user types `/project-dir` or asks to change/select the project folder:
  - Show the current path.
  - Ask if they want to change it via GUI picker (`-PickGui`) or by entering a new path.
  - Display existing projects.
