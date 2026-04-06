#!/bin/bash
# Dotfiles installer for WSL + tmux + Claude Code environment
# Usage: ./install.sh

set -e

GREEN="\033[0;32m"
YELLOW="\033[1;33m"
NC="\033[0m"

DOTFILES_DIR=""

echo -e "=== Installing dotfiles ==="
echo -e "==========================="

# tmux config
echo -e "[1/4] Installing tmux config..."
cp "/tmux/.tmux.conf" "/home/cyc/.tmux.conf"
echo "  -> ~/.tmux.conf"

# git attributes
echo -e "[2/4] Installing git config..."
cp "/git/.gitattributes_global" "/home/cyc/.gitattributes_global"
git config --global core.attributesFile "/home/cyc/.gitattributes_global"
git config --global core.autocrlf input
git config --global core.fileMode false
git config --global core.eol lf
git config --global init.defaultBranch main
echo "  -> ~/.gitattributes_global"
echo "  -> git global config updated"

# scripts
echo -e "[3/4] Installing scripts..."
mkdir -p "/home/cyc/bin"
cp "/bin/claude-tmux" "/home/cyc/bin/claude-tmux"
cp "/bin/claude-multi" "/home/cyc/bin/claude-multi"
chmod +x "/home/cyc/bin/claude-tmux" "/home/cyc/bin/claude-multi"
echo "  -> ~/bin/claude-tmux"
echo "  -> ~/bin/claude-multi"

# Add ~/bin to PATH if not there
if ! grep -q 'export PATH="/home/cyc/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/ASUS/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/ASUS/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/nodejs:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/GitHub CLI:/mnt/d/python/Scripts:/mnt/d/python:/mnt/c/Users/ASUS/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/ASUS/AppData/Local/Microsoft/WindowsApps:/mnt/d/Microsoft VS Code/bin:/mnt/c/Users/ASUS/AppData/Roaming/npm:/mnt/c/Users/ASUS/.local/bin:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-hud/claude-hud/0.0.10/bin:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-plugins-official/skill-creator/unknown/bin:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-plugins-official/superpowers/5.0.7/bin"' "/home/cyc/.bashrc"; then
    echo '' >> "/home/cyc/.bashrc"
    echo '# Custom scripts' >> "/home/cyc/.bashrc"
    echo 'export PATH="/home/cyc/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Users/ASUS/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/ASUS/bin:/mnt/c/Windows/system32:/mnt/c/Windows:/mnt/c/Windows/System32/Wbem:/mnt/c/Windows/System32/WindowsPowerShell/v1.0:/mnt/c/Windows/System32/OpenSSH:/mnt/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/nodejs:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/GitHub CLI:/mnt/d/python/Scripts:/mnt/d/python:/mnt/c/Users/ASUS/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/ASUS/AppData/Local/Microsoft/WindowsApps:/mnt/d/Microsoft VS Code/bin:/mnt/c/Users/ASUS/AppData/Roaming/npm:/mnt/c/Users/ASUS/.local/bin:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-hud/claude-hud/0.0.10/bin:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-plugins-official/skill-creator/unknown/bin:/mnt/c/Users/ASUS/.claude/plugins/cache/claude-plugins-official/superpowers/5.0.7/bin"' >> "/home/cyc/.bashrc"
    echo "  -> Added ~/bin to PATH"
fi

# projects dir
echo -e "[4/4] Creating projects directory..."
mkdir -p "/home/cyc/projects"
echo "  -> ~/projects/"

echo ""
echo -e "=== Installation complete! ==="
echo -e "==========================="
echo ""
echo "Next steps:"
echo "  1. Install tmux:       sudo apt install tmux"
echo "  2. Install Node.js:    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash"
echo "                         source ~/.bashrc && nvm install 22"
echo "  3. Install Claude Code: npm install -g @anthropic-ai/claude-code"
echo "  4. Reload shell:       source ~/.bashrc"
echo "  5. Start working:      claude-tmux my-project ~/projects/my-project"
