# Dotfiles - WSL + tmux + Claude Code

Personal development environment configuration for multi-project Claude Code workflow.

## Setup (WSL only)

    wsl
    git clone https://github.com/billchen-hub/dotfiles.git ~/dotfiles
    cd ~/dotfiles && ./install.sh

## Contents

- install.sh - WSL full setup (tmux + scripts + git config)
- tmux/.tmux.conf - tmux config (Ctrl+A prefix, mouse, vi copy)
- git/.gitattributes_global - cross-platform line endings (WSL global fallback)
- bin/claude-tmux - single project session launcher
- bin/claude-multi - multi-project workspace launcher

## Note on .gitattributes

When developing in WSL, each project repo should contain a .gitattributes file
to ensure consistent line endings across platforms. This is only needed for
repos developed in WSL that will also be used on Windows.
