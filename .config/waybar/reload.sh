#!/bin/bash

# --- Prevent multiple instances ---
LOCK_FILE="/tmp/waybar_reload.lock"
if [ -f "$LOCK_FILE" ]; then
    PID=$(cat "$LOCK_FILE")
    if ps -p "$PID" > /dev/null; then
        echo "Waybar reloader is already running (PID: $PID)."
        exit 1
    fi
fi
echo $$ > "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"; exit' INT TERM EXIT

CONFIG_FILE="$HOME/.config/waybar/config.jsonc"
STYLE_FILE="$HOME/.config/waybar/style.css"

if ! command -v inotifywait >/dev/null 2>&1; then
    echo "Error: inotifywait not found. Please install inotify-tools."
    exit 1
fi

if [[ ! -f "$CONFIG_FILE" || ! -f "$STYLE_FILE" ]]; then
    echo "Error: Config or style file not found."
    exit 1
fi

echo "Monitoring Waybar config and style files for changes..."

inotifywait -m "$CONFIG_FILE" "$STYLE_FILE" -e modify |
while read -r path _; do
    echo "Change detected in $path. Reloading Waybar..."
    pkill -x waybar
    # Start Waybar in background
    waybar -c "$CONFIG_FILE" -s "$STYLE_FILE" > /dev/null 2>&1 &
    echo "Waybar reloaded."
done