#!/usr/bin/env bash

# ----------------------------------------------------- 
# --- CYAN RICE DOTFILES BACKUP SCRIPT ---
# ----------------------------------------------------- 

SOURCE_DIR="$HOME/.config"
BACKUP_DIR="$HOME/DOTFILES/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
CONFIG=("hypr" "kitty" "fish" "waybar" "wofi" "dunst" "nvim" "fastfetch" "btop" "lsd")

# ANSI Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${CYAN}==========================================${NC}"
echo -e "${CYAN}   CYAN RICE BACKUP INITIATED${NC}"
echo -e "${CYAN}==========================================${NC}"

mkdir -p "$BACKUP_DIR"

for config in "${CONFIG[@]}"; do
    if [ -d "$SOURCE_DIR/$config" ]; then
        echo -n "Backing up: $config... "
        if cp -r "$SOURCE_DIR/$config" "$BACKUP_DIR/" 2>/dev/null; then
            echo -e "${GREEN}DONE${NC}"
        else
            echo -e "${RED}FAILED${NC}"
        fi
    else
        echo -e "Skip: $config (${RED}Folder not found${NC})"
    fi
done

echo -e "${CYAN}==========================================${NC}"
echo -e "   ${GREEN}BACKUP DONE!${NC} Location: $BACKUP_DIR"
echo -e "${CYAN}==========================================${NC}"
