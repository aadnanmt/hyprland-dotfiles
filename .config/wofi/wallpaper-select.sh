#!/bin/bash

# -----------------------------------------------------
# --- CYAN RICE WALLPAPER SELECTOR | Adapted from github.com/elifouts/Dotfiles ---
# -----------------------------------------------------

# --- Toggle Logic ---
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

# --- Parallel Thumbnail Generation ---
export CACHE_DIR
# Supported formats: jpg, jpeg, png, webp
SUPPORTED_EXT="\( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \)"
FILES=$(find . -maxdepth 1 -type f $SUPPORTED_EXT -printf "%P\n" | sort)

echo "$FILES" | xargs -I {} -P $(nproc) bash -c '
    img="{}"
    hash_name=$(echo -n "$img" | md5sum | awk "{print \$1}")
    thumb="$CACHE_DIR/$hash_name.jpg"
    if [ ! -s "$thumb" ]; then
        magick "$img" -thumbnail 300x300^ -gravity center -extent 300x300 -quality 75 -strip "$thumb" 2>/dev/null
    fi
'

# Build the list for wofi
LIST=""
while IFS= read -r img; do
    [ -z "$img" ] && continue
    hash_name=$(echo -n "$img" | md5sum | awk '{print $1}')
    thumb_path="$CACHE_DIR/$hash_name.jpg"
    LIST="${LIST}img:${thumb_path}:text:${img}\n"
done <<< "$FILES"

# exec wofi
SELECTED_RAW=$(echo -e "$LIST" | wofi --dmenu \
    --conf "$CONFIG_FILE" \
    --style "$STYLE_FILE" \
    --prompt "Select Wallpaper" \
--cache-file /dev/null)

SELECTED=$(echo "$SELECTED_RAW" | sed 's/.*:text://')

if [ -n "$SELECTED" ]; then
    WALLPAPER_PATH="$WALLPAPER_DIR/$SELECTED"
    
    hyprctl hyprpaper unload all
    
    
    MONITORS=$(hyprctl monitors -j | jq -r '.[].name')
    for m in $MONITORS; do
        hyprctl hyprpaper wallpaper "$m,$WALLPAPER_PATH"
    done
    
    cat <<EOF > "$HOME/.config/hypr/hyprpaper.conf"
preload = $WALLPAPER_PATH

wallpaper {
    monitor =
    path = $WALLPAPER_PATH
}

ipc = true
splash = false
EOF
    
fi