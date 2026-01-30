# Vim Installation & Configuration Guide

This guide explains how to set up your Sublime-like Vim configuration on a new machine.

---

## Prerequisites

### macOS

```bash
# Install Homebrew (if not installed)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Vim (latest version)
brew install vim

# Install dependencies
brew install fzf ripgrep git
```

### Linux (Ubuntu/Debian) - SSH/Command-line

```bash
# Update package list
sudo apt update

# Install Vim and dependencies
sudo apt install vim fzf ripgrep git curl
```

### Linux (Fedora/RHEL) - SSH/Command-line

```bash
# Install Vim and dependencies
sudo dnf install vim-enhanced fzf ripgrep git curl
```

### Linux (Arch) - SSH/Command-line

```bash
# Install Vim and dependencies
sudo pacman -S vim fzf ripgrep git curl
```

---

## Installation Steps

### 1. Clone your dotfiles

```bash
cd ~
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/Documents/dotfiles
```

Or copy from backup:
```bash
cp -r /path/to/backup/dotfiles ~/Documents/dotfiles
```

### 2. Install vim-plug (plugin manager)

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 3. Create symlink to vimrc

```bash
ln -sf ~/Documents/dotfiles/vimrc ~/.vimrc
```

### 4. Create required directories

```bash
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
```

### 5. Install plugins

```bash
vim +PlugInstall +qall
```

Or open vim and run:
```vim
:PlugInstall
```

### 6. Install Claude Code (optional, for AI integration)

```bash
# macOS
brew install claude-code

# Or via npm
npm install -g @anthropic-ai/claude-code
```

---

## Quick Install Script

Save this as `install-vim.sh` and run it:

```bash
#!/bin/bash

set -e

echo "==> Installing Vim configuration..."

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "==> Detected macOS"

    # Install Homebrew if not present
    if ! command -v brew &> /dev/null; then
        echo "==> Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Install packages
    echo "==> Installing vim, fzf, ripgrep..."
    brew install vim fzf ripgrep git

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "==> Detected Linux"

    if command -v apt &> /dev/null; then
        echo "==> Using apt..."
        sudo apt update
        sudo apt install -y vim-gtk3 fzf ripgrep git curl
    elif command -v dnf &> /dev/null; then
        echo "==> Using dnf..."
        sudo dnf install -y vim-enhanced fzf ripgrep git curl
    elif command -v pacman &> /dev/null; then
        echo "==> Using pacman..."
        sudo pacman -S --noconfirm vim fzf ripgrep git curl
    fi
fi

# Install vim-plug
echo "==> Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create directories
echo "==> Creating vim directories..."
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup

# Symlink vimrc
echo "==> Linking vimrc..."
ln -sf ~/Documents/dotfiles/vimrc ~/.vimrc

# Install plugins
echo "==> Installing vim plugins..."
vim +PlugInstall +qall

echo "==> Done! Vim is ready to use."
```

Make it executable and run:
```bash
chmod +x install-vim.sh
./install-vim.sh
```

---

## File Structure

```
~/Documents/dotfiles/
├── vimrc                 # Main vim configuration
├── vim-cheatsheet.md     # Keybindings reference
├── vim-install.md        # This file
└── bash/
    └── aliases           # Bash aliases

~/.vim/
├── autoload/
│   └── plug.vim          # Plugin manager
├── plugged/              # Installed plugins (auto-created)
├── undo/                 # Persistent undo files
└── backup/               # Backup files
```

---

## Installed Plugins

| Plugin | Purpose |
|--------|---------|
| fzf + fzf.vim | Fuzzy file finder (Ctrl+p) |
| nerdtree | File sidebar (Ctrl+b) |
| vim-visual-multi | Multi-cursor editing |
| vim-commentary | Comment toggle (,/) |
| vim-surround | Surround text with quotes/brackets |
| auto-pairs | Auto-close brackets |
| vim-fugitive | Git integration |
| vim-gitgutter | Git diff in gutter |
| lightline.vim | Status line |
| ayu-vim | Color scheme |
| vim-polyglot | Language syntax support |

---

## Updating Plugins

```vim
:PlugUpdate
```

---

## Troubleshooting

### Plugins not working
```bash
# Reinstall plugins
vim +PlugClean +PlugInstall +qall
```

### Colors look wrong
Make sure your terminal supports true colors:
```bash
# Check terminal
echo $TERM

# Should be xterm-256color or similar
# Add to ~/.bashrc or ~/.zshrc if needed:
export TERM=xterm-256color
```

### Icons not displaying
The status line uses Unicode symbols that should work with most fonts. If not:
- Make sure your terminal uses a UTF-8 encoding
- Try a different font (Monaco, Menlo, or any Nerd Font)

### fzf not working
```bash
# macOS
brew reinstall fzf
$(brew --prefix)/opt/fzf/install

# Linux
# Make sure fzf is in PATH
which fzf
```

### Claude Code integration not working
```bash
# Check if claude is installed
which claude

# Make sure you're logged in
claude --version
```

---

## Linux via SSH Notes

### Clipboard (Copy/Paste over SSH)

Over SSH, vim's clipboard won't sync with your local machine. Options:

1. **Use vim's yank** - copy within vim using `y`, paste with `p`
2. **OSC 52** - Some terminals (iTerm2) support clipboard over SSH:
   ```vim
   " Add to vimrc for OSC 52 clipboard support
   set clipboard=unnamed
   ```
3. **Manual copy** - Select text in terminal, use `Cmd+C` (iTerm2)

### Terminal Settings

For best colors over SSH, set in your local `~/.ssh/config`:
```
Host *
  SetEnv TERM=xterm-256color
```

Or on the remote server, add to `~/.bashrc`:
```bash
export TERM=xterm-256color
```

### Performance over SSH

If vim feels slow over SSH:
```vim
" Add to vimrc - reduce updates
set lazyredraw
set ttyfast
```

Already included in your config.

---

## Backup Your Config

```bash
# Create a git repo for your dotfiles
cd ~/Documents/dotfiles
git init
git add vimrc vim-cheatsheet.md vim-install.md bash/
git commit -m "Vim configuration backup"

# Push to GitHub (create repo first)
git remote add origin https://github.com/YOUR_USERNAME/dotfiles.git
git push -u origin main
```
