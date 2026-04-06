# Dotfiles - WSL + tmux + Claude Code

Personal development environment configuration.

## Two installation paths

### Company computer (Windows only, no WSL, no git clone)

1. Open https://github.com/billchen-hub/dotfiles
2. Click green "Code" button -> "Download ZIP"
3. Extract the ZIP to any folder
4. Open CMD or PowerShell, cd into that folder
5. Run: python install_windows.py

This only sets up git config and .gitattributes. No WSL or Linux tools needed.

### Home computer (Windows + WSL)

    wsl
    git clone https://github.com/billchen-hub/dotfiles.git ~/dotfiles
    cd ~/dotfiles && ./install.sh

## Contents

- install_windows.py - Windows-only setup (git config + .gitattributes)
- install.sh - WSL full setup (tmux + scripts + git config)
- tmux/.tmux.conf - tmux config (Ctrl+A prefix, mouse, vi copy)
- git/.gitattributes_global - cross-platform line endings
- bin/claude-tmux - single project session launcher (WSL only)
- bin/claude-multi - multi-project workspace launcher (WSL only)

## Cross-Platform Coding Rules

1. Paths: Use pathlib.Path() in Python, path.join() in Node.js
2. Line endings: Handled automatically by .gitattributes
3. Automation: Write Python scripts, not .sh or .bat
4. Env vars: Use .env files with python-dotenv
5. File permissions: git ignores changes via core.fileMode=false
