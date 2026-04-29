#!/bin/bash

# Toggle logic
if pgrep -x "wofi" > /dev/null; then
    pkill -x "wofi"
    exit 0
fi

# --- Config optimize Cyan Rice Wallpaper Selector---
WALLPAPER_DIR="$HOME/.config/wallpapers"
CACHE_DIR="$HOME/.cache/wofi-thumbs"
CONFIG_FILE="$HOME/.config/wofi/wallpaper.conf"
STYLE_FILE="$HOME/.config/wofi/style-wallpaper.css"

mkdir -p "$CACHE_DIR"
cd "$WALLPAPER_DIR" || exit 1

generate_thumb() {
    local img="$1"
    local hash_name=$(echo -n "$img" | md5sum | awk '{print $1}')
    local thumb="$CACHE_DIR/$hash_name.jpg"
    
    if [ ! -s "$thumb" ]; then
        magick "$img" -thumbnail 300x300^ -gravity center -extent 300x300 -quality 75 -strip "$thumb" 2>/dev/null
    fi
    echo "$thumb"
}

LIST=""
for img in *.{jpg,jpeg,png}; do
    [ -e "$img" ] || continue
    thumb_path=$(generate_thumb "$img")
    LIST="${LIST}img:${thumb_path}:text:${img}\n"
done

# exec wofi
SELECTED_RAW=$(echo -e "$LIST" | wofi --dmenu \
    --conf "$CONFIG_FILE" \
    --style "$STYLE_FILE" \
    --prompt "Select Wallpaper" \
    --cache-file /dev/null)

SELECTED=$(echo "$SELECTED_RAW" | sed 's/.*:text://')

if [ -n "$SELECTED" ]; then
    WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED"
    
    hyprctl hyprpaper preload "$WALLPAPER_PATH"
    MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
    for m in $MONITORS; do
        hyprctl hyprpaper wallpaper "$m,$WALLPAPER_PATH"
    done
    hyprctl hyprpaper unload all
    
    cat <<EOF > ~/.config/hypr/hyprpaper.conf
preload = $WALLPAPER_PATH
wallpaper = ,$WALLPAPER_PATH
splash = false
EOF
fi
