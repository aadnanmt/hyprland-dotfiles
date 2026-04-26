#!/usr/bin/env bash

# --- Cyan rice dotfiles install ---
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "=========================================="
echo "   CYAN RICE HYPRLAND INSTALLER"
echo "=========================================="
echo -e "${NC}"

# Make sure scripts executable
chmod +x setup/*.sh

# Run all scripts in setup folder
for script in setup/*.sh; do
    if [ -f "$script" ]; then
        bash "$script"
    fi
done

echo -e "${CYAN}"
echo "=========================================="
echo "      INSTALLATION COMPLETE!"
echo "=========================================="
echo -e "${NC}"
