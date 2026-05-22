function p --wraps pacman --description 'Pacman wrapper with sudo'
    if count $argv > 0
        sudo pacman $argv
    else
        sudo pacman -Syu
    end
end
