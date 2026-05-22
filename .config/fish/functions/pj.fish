function pj --description 'Project Jumper'
    set -l base "$HOME/Project"
    
    # Ensure base directory exists
    if not test -d "$base"
        echo "Error: Base directory '$base' does not exist."
        return 1
    end

    if count $argv > 0
        set -l target ""
        switch "$argv[1]"
            case 'nanoo'
                set target "$base/nanoo-Git"
            case 'me'
                set target "$base/me-Git"
            case 'sys'
                set target "$base/sys-Git"
            case 'exp'
                set target "$base/experiments-Git"
            case '*'
                echo "Error: Project '$argv[1]' not found in the list."
                echo "Available: nanoo, me, sys, exp"
                return 1
        end

        if test -d "$target"
            cd "$target"
            lsd
        else
            echo "Error: Directory '$target' not found."
        end
    else
        cd "$base"
        lsd
    end
end
