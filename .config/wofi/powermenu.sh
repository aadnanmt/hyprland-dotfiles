#!/usr/bin/env bash

# -----------------------------------------------------
# --- POWER MENU ---
# -----------------------------------------------------

# --- Toggle Logic ---
if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
    exit 0
fi

# Option
shutdown='󰐥 Shutdown'
reboot='󰜉 Reboot'
lock='󰌾 Lock'
suspend='󰤄 Suspend'
logout='󰍃 Logout'

# Power menu logic
selected=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | wofi --dmenu --prompt "Power Menu" --width 250 --height 280 --cache-file /dev/null)

case $selected in
    "$shutdown")
        systemctl poweroff
    ;;
    "$reboot")
        systemctl reboot
    ;;
    "$lock")
        hyprlock
    ;;
    "$suspend")
        systemctl suspend
    ;;
    "$logout")
        hyprctl dispatch exit
    ;;
esac
