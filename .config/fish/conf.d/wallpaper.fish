# =============================================================================
#  WALLPAPER HANDLING
# =============================================================================

function wall
    if test -f "$argv[1]"
        set wall_path (realpath "$argv[1]")
        
        # update hyprpaper.conf
        echo "preload = $wall_path" > ~/.config/hypr/hyprpaper.conf
        echo "wallpaper = ,$wall_path" >> ~/.config/hypr/hyprpaper.conf
        echo "splash = false" >> ~/.config/hypr/hyprpaper.conf
        
        # reload hyprpaper
        pkill hyprpaper
        hyprpaper & disown
        
        echo "Wallpaper updated to: $wall_path"
    else
        echo "File tidak ditemukan, Cuyy!"
    end
end
