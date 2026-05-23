function clean --description 'System Cleaning (Arch Linux)'
    echo "---  Cleaning Pacman cache ---"
    sudo pacman -Sc --noconfirm
    
    echo "---  Removing orphan packages ---"
    set -l orphans (pacman -Qdtq)
    if test -n "$orphans"
        sudo pacman -Rs $orphans --noconfirm
    else
        echo "Success: No orphan packages found."
    fi
    
    echo "--- Cleaning user cache (~/.cache) ---"
    rm -rf ~/.cache/paru/clone/*
    rm -rf ~/.cache/thumbnails/*
    
    echo "--- System is clean and optimized! ---"
end
