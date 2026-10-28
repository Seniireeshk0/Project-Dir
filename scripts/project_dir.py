#!/usr/bin/env python3
"""
Project-Dir utility for Antigravity.
"""

import sys
import os
import json
import argparse
from pathlib import Path

CONFIG_DIR = Path(r"C:\Users\arsen\.gemini\config")
CONFIG_FILE = CONFIG_DIR / "workspace_settings.json"

def get_settings():
    if CONFIG_FILE.exists():
        try:
            with open(CONFIG_FILE, "r", encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            pass
    # Default fallback
    default_root = "D:\\Projects" if os.path.exists("D:\\") else r"C:\Users\arsen\Projects"
    return {
        "projects_root": default_root,
        "version": "1.0.0"
    }

def save_settings(settings):
    CONFIG_DIR.mkdir(parents=True, exist_ok=True)
    with open(CONFIG_FILE, "w", encoding="utf-8") as f:
        json.dump(settings, f, indent=2, ensure_ascii=False)
    print(f"Config saved to: {CONFIG_FILE}")

def main():
    parser = argparse.ArgumentParser(description="Antigravity Project-Dir Utility")
    parser.add_argument("--get-root", action="store_true", help="Print current projects root directory")
    parser.add_argument("--set-root", type=str, help="Set projects root directory")
    parser.add_argument("--list-projects", action="store_true", help="List all projects in the projects root")
    parser.add_argument("--new-project", type=str, help="Create a dedicated project subfolder")
    parser.add_argument("--desc", type=str, default="", help="Description for README.md")

    args = parser.parse_args()

    if args.set_root:
        resolved = os.path.abspath(args.set_root)
        os.makedirs(resolved, exist_ok=True)
        settings = get_settings()
        settings["projects_root"] = resolved
        save_settings(settings)
        print(f"SUCCESS: Root directory set to: {resolved}")
        return

    if args.new_project:
        settings = get_settings()
        root = Path(settings["projects_root"])
        root.mkdir(parents=True, exist_ok=True)
        p_dir = root / args.new_project
        if not p_dir.exists():
            (p_dir / "src").mkdir(parents=True, exist_ok=True)
            (p_dir / "docs").mkdir(parents=True, exist_ok=True)
            readme = p_dir / "README.md"
            readme.write_text(f"# {args.new_project}\n\n{args.desc}\n\n## Structure\n- `src/`: Source code\n- `docs/`: Notes and documentation\n", encoding="utf-8")
            print(f"SUCCESS: Created project folder at: {p_dir}")
        else:
            print(f"EXISTS: Project folder already exists at: {p_dir}")
        return

    if args.list_projects:
        settings = get_settings()
        root = Path(settings["projects_root"])
        print(f"Projects Root: {root}")
        if root.exists():
            subdirs = [d for d in root.iterdir() if d.is_dir()]
            if not subdirs:
                print(f"No projects found yet in {root}")
            else:
                print("Existing projects:")
                for d in subdirs:
                    print(f" - {d.name} ({d})")
        else:
            print(f"Root folder does not exist yet: {root}")
        return

    # Default
    settings = get_settings()
    print(f"Projects Root: {settings.get('projects_root')}")

if __name__ == "__main__":
    main()
