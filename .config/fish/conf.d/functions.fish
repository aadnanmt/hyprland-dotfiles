# =============================================================================
#  FUNCTIONS
# =============================================================================

# My Cheat Sheet
function cuyy
    echo -e "--- \e[36mMEMORY CMD LINE\e[0m ---"
    echo -e "\e[34m[System]\e[0m   localip, publicip, ports, wifi, reload, sys- (power)"
    echo -e "\e[34m[Pkg]\e[0m      p- (pacman), y- (yay), pr- (paru), i (install)"
    echo -e "\e[34m[Dev]\e[0m      clean, venv, activate, extract <file>"
    echo -e "\e[34m[Rice]\e[0m     conf-hypr, cf (fish), cnvim, cw (waybar), cr (rofi)"
    echo -e "\e[34m[Git]\e[0m      gs, ga, gc, gco, gb, gp, gl, glog, lg"
    echo -e "\e[34m[Stack]\e[0m    b (bun), p (pnpm), n (node), dk (docker), pm (podman)"
    echo -e "\e[34m[TUI]\e[0m      y (yazi), lkd (lazydocker), top, cv, pipes"
    echo -e "------------------------------------"
end

# Yazi (CWD on quit)
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Universal extract
function extract
    if test -f "$argv[1]"
        switch "$argv[1]"
            case '*.tar.bz2'; tar xjf "$argv[1]"
            case '*.tar.gz';  tar xzf "$argv[1]"
            case '*.bz2';     bunzip2 "$argv[1]"
            case '*.rar';     unrar x "$argv[1]"
            case '*.gz';      gunzip "$argv[1]"
            case '*.tar';     tar xf "$argv[1]"
            case '*.tbz2';    tar xjf "$argv[1]"
            case '*.tgz';     tar xzf "$argv[1]"
            case '*.zip';     unzip "$argv[1]"
            case '*.Z';       uncompress "$argv[1]"
            case '*.7z';      7z x "$argv[1]"
            case '*';         echo "'$argv[1]' cannot be extracted"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

# Arch cleanup
function clean
    set orphans (pacman -Qtdq)
    test -n "$orphans"; and sudo pacman -Rns $orphans; or echo "No orphans to remove."
    test -f (which yay); and yay -Sc --noconfirm
    test -f (which paru); and paru -Sc --noconfirm
end

# Container helpers
function dkstop
    set containers (docker ps -q)
    test -n "$containers"; and docker stop $containers; or echo "No docker containers."
end

function pmstop
    set containers (podman ps -q)
    test -n "$containers"; and podman stop $containers; or echo "No podman containers."
end
