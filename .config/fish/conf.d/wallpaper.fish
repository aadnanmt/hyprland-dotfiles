# =============================================================================
#  WALLPAPER HANDLING (OPTIMIZED IPC)
# =============================================================================

function wall
    if test -f "$argv[1]"
        set wall_path (realpath "$argv[1]")
        
        # 1. Preload the new wallpaper via IPC
        hyprctl hyprpaper preload "$wall_path"
        
        # 2. Apply to all active monitors
        set monitors (hyprctl monitors -j | jq -r '.[].name')
        for m in $monitors
            hyprctl hyprpaper wallpaper "$m,$wall_path"
        end
        
        # 3. Clean up old preloads to save VRAM
        hyprctl hyprpaper unload all
        
        # 4. Persistence: update config file for next boot
        echo "preload = $wall_path" > ~/.config/hypr/hyprpaper.conf
        echo "wallpaper = ,$wall_path" >> ~/.config/hypr/hyprpaper.conf
        echo "splash = false" >> ~/.config/hypr/hyprpaper.conf
        
        echo "Wallpaper updated via IPC to: $wall_path"
    else
        echo "File tidak ditemukan, Bray! Cek lagi path-nya."
    end
end
