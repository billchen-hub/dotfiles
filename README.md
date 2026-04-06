# Dotfiles - WSL + tmux + Claude Code

Personal dev environment config for multi-project Claude Code workflow on Windows WSL.

## Quick Install
  git clone <your-repo-url> ~/dotfiles
  cd ~/dotfiles && ./install.sh

## Contents
- tmux/.tmux.conf - tmux config (Ctrl+A prefix, mouse, vi copy)
- git/.gitattributes_global - cross-platform line endings
- bin/claude-tmux - single project session launcher
- bin/claude-multi - multi-project workspace launcher
- install.sh - one-click installer

## Cross-Platform Notes
1. Paths: Use pathlib.Path() in Python
2. Line endings: Handled by .gitattributes
3. Automation: Use Python not .sh scripts
4. Env vars: Use .env files with python-dotenv
5. File permissions: git ignores via core.fileMode=false
