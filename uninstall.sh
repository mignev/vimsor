#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Uninstalling Vimsor...${NC}"

# Remove symlink
if [ -L "$HOME/.vimrc" ]; then
    echo "Removing vimrc symlink..."
    rm "$HOME/.vimrc"
fi

# Restore backup if exists
latest_backup=$(ls -t "$HOME/.vimrc.backup."* 2>/dev/null | head -1)
if [ -n "$latest_backup" ]; then
    echo "Restoring backup: $latest_backup"
    cp "$latest_backup" "$HOME/.vimrc"
fi

# Remove plugins
if [ -d "$HOME/.vim/plugged" ]; then
    read -p "Remove installed plugins (~/.vim/plugged)? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.vim/plugged"
        echo "Plugins removed."
    fi
fi

# Remove vimsor directory
if [ -d "$HOME/.vimsor" ]; then
    read -p "Remove Vimsor directory (~/.vimsor)? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$HOME/.vimsor"
        echo "Vimsor directory removed."
    fi
fi

echo -e "${GREEN}Vimsor uninstalled.${NC}"
