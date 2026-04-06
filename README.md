# Dotfiles - WSL + tmux + Claude Code

Personal development environment configuration.

## Two installation paths

### Company computer (Windows only, no WSL)

Only installs git config and .gitattributes for cross-platform line endings.

    git clone https://github.com/billchen-hub/dotfiles.git
    cd dotfiles
    python install_windows.py

### Home computer (Windows + WSL)

Full setup: tmux config, Claude Code launcher scripts, git config.

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
