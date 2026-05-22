function wall --description 'Wallpaper handler with IPC and persistence'
    if test -f "$argv[1]"
        set -l wall_path (realpath "$argv[1]")
        
        # Preload and apply via IPC
        hyprctl hyprpaper preload "$wall_path"
        
        set -l monitors (hyprctl monitors -j | jq -r '.[].name')
        for m in $monitors
            hyprctl hyprpaper wallpaper "$m,$wall_path"
        end
        
        # Unload all to save VRAM (optional, depending on usage)
        hyprctl hyprpaper unload all
        
        # Update config for persistence
        echo "preload = $wall_path" > ~/.config/hypr/hyprpaper.conf
        echo "wallpaper = ,$wall_path" >> ~/.config/hypr/hyprpaper.conf
        echo "splash = false" >> ~/.config/hypr/hyprpaper.conf
        
        echo "Success: Wallpaper updated to $wall_path"
    else
        echo "Error: File not found or invalid path."
    end
end
