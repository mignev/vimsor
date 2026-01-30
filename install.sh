#!/bin/bash

set -e

VIMSOR_DIR="${VIMSOR_DIR:-$HOME/.vimsor}"
VIMRC="$HOME/.vimrc"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_banner() {
    echo -e "${BLUE}"
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║   ██╗   ██╗██╗███╗   ███╗███████╗ ██████╗ ██████╗         ║"
    echo "║   ██║   ██║██║████╗ ████║██╔════╝██╔═══██╗██╔══██╗        ║"
    echo "║   ██║   ██║██║██╔████╔██║███████╗██║   ██║██████╔╝        ║"
    echo "║   ╚██╗ ██╔╝██║██║╚██╔╝██║╚════██║██║   ██║██╔══██╗        ║"
    echo "║    ╚████╔╝ ██║██║ ╚═╝ ██║███████║╚██████╔╝██║  ██║        ║"
    echo "║     ╚═══╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝        ║"
    echo "║                                                           ║"
    echo "║         Cursor-like Vim with Claude AI Integration        ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${GREEN}==>${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}Warning:${NC} $1"
}

print_error() {
    echo -e "${RED}Error:${NC} $1"
}

detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt &> /dev/null; then
            echo "debian"
        elif command -v dnf &> /dev/null; then
            echo "fedora"
        elif command -v pacman &> /dev/null; then
            echo "arch"
        else
            echo "linux"
        fi
    else
        echo "unknown"
    fi
}

install_dependencies() {
    local os=$(detect_os)
    print_step "Detected OS: $os"

    case $os in
        macos)
            print_step "Installing dependencies with Homebrew..."
            if ! command -v brew &> /dev/null; then
                print_step "Installing Homebrew..."
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            fi
            brew install vim fzf ripgrep git 2>/dev/null || true
            ;;
        debian)
            print_step "Installing dependencies with apt..."
            sudo apt update
            sudo apt install -y vim fzf ripgrep git curl
            ;;
        fedora)
            print_step "Installing dependencies with dnf..."
            sudo dnf install -y vim-enhanced fzf ripgrep git curl
            ;;
        arch)
            print_step "Installing dependencies with pacman..."
            sudo pacman -S --noconfirm vim fzf ripgrep git curl
            ;;
        *)
            print_warning "Unknown OS. Please install vim, fzf, ripgrep, git manually."
            ;;
    esac
}

install_vim_plug() {
    print_step "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

create_directories() {
    print_step "Creating vim directories..."
    mkdir -p ~/.vim/undo
    mkdir -p ~/.vim/backup
}

backup_vimrc() {
    if [ -f "$VIMRC" ]; then
        local backup="$VIMRC.backup.$(date +%Y%m%d%H%M%S)"
        print_step "Backing up existing vimrc to $backup"
        cp "$VIMRC" "$backup"
    fi
}

install_vimrc() {
    print_step "Installing vimrc..."

    # If running from cloned repo
    if [ -f "$VIMSOR_DIR/config/vimrc" ]; then
        ln -sf "$VIMSOR_DIR/config/vimrc" "$VIMRC"
    # If running via curl
    elif [ -f "$(dirname "$0")/config/vimrc" ]; then
        local script_dir="$(cd "$(dirname "$0")" && pwd)"
        ln -sf "$script_dir/config/vimrc" "$VIMRC"
    else
        print_step "Downloading vimrc..."
        curl -fLo "$VIMRC" \
            https://raw.githubusercontent.com/mignev/vimsor/main/config/vimrc
    fi
}

install_plugins() {
    print_step "Installing vim plugins..."
    vim +PlugInstall +qall
}

print_success() {
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║              Vimsor installed successfully!               ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Quick start:"
    echo "  vim                    # Open vim"
    echo "  Ctrl+P                 # Fuzzy file finder"
    echo "  Ctrl+B                 # Toggle sidebar"
    echo "  ,cc                    # Open Claude chat"
    echo ""
    echo "Full cheatsheet: https://github.com/mignev/vimsor/blob/main/docs/CHEATSHEET.md"
    echo ""
}

check_claude() {
    if command -v claude &> /dev/null; then
        print_step "Claude Code detected - AI features enabled"
    else
        print_warning "Claude Code not found. AI features won't work."
        echo "  Install: https://claude.ai/code"
    fi
}

main() {
    print_banner

    install_dependencies
    install_vim_plug
    create_directories
    backup_vimrc
    install_vimrc
    install_plugins
    check_claude

    print_success
}

main "$@"
