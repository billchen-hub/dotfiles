"""
Windows setup script (no WSL required)
Installs: git global config + .gitattributes for cross-platform development
Usage: python install_windows.py
"""
import subprocess
import shutil
from pathlib import Path

def run(cmd):
    print(f"  > {cmd}")
    subprocess.run(cmd, shell=True, check=True)

def main():
    home = Path.home()
    script_dir = Path(__file__).parent.resolve()

    print("=== Windows Dotfiles Setup ===")
    print()

    # 1. Copy .gitattributes_global
    src = script_dir / "git" / ".gitattributes_global"
    dst = home / ".gitattributes_global"
    if src.exists():
        shutil.copy2(src, dst)
        print(f"[1/2] Copied .gitattributes_global -> {dst}")
    else:
        print(f"[1/2] WARNING: {src} not found, skipping")

    # 2. Set git global config
    print("[2/2] Setting git global config...")
    run(f'git config --global core.attributesFile "{dst}"')
    run('git config --global core.autocrlf input')
    run('git config --global core.fileMode false')
    run('git config --global core.eol lf')
    run('git config --global init.defaultBranch main')

    print()
    print("=== Done! ===")
    print("Git is now configured for cross-platform development.")
    print("All repos will use LF line endings and ignore file permission changes.")

if __name__ == "__main__":
    main()
