#!/usr/bin/env bash

# ----------------------------------------------------- 
# --- CYAN RICE DOTFILES BACKUP SCRIPT ---
# ----------------------------------------------------- 

SOURCE_DIR="$HOME/.config"
BACKUP_DIR="$HOME/DOTFILES/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
CONFIG=("hypr" "kitty" "fish" "waybar" "wofi" "dunst" "nvim" "fastfetch" "btop" "lsd")

echo "=========================================="
echo "   CYAN RICE BACKUP INITIATED"
echo "=========================================="

mkdir -p "$BACKUP_DIR"

for config in "${CONFIG[@]}"; do
    if [ -d "$SOURCE_DIR/$config" ]; then
        echo "Backing up: $config..."
        cp -r "$SOURCE_DIR/$config" "$BACKUP_DIR/"
    else
        echo "Skip: $config (Folder not found)"
    fi
done

echo "=========================================="
echo "   BACKUP DONE! Location: $BACKUP_DIR"
echo "=========================================="
