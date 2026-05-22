function pa --wraps paru --description 'Paru (AUR) wrapper'
    if count $argv > 0
        paru $argv
    else
        paru -Syu
    end
end
