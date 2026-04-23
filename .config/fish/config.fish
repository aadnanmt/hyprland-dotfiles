# =============================================================================
#  INITIALIZATION
# =============================================================================
starship init fish | source
set -g fish_greeting ""

# =============================================================================
#   MY CHEAT SHEET CUS
# =============================================================================
function cuyy
    echo -e "--- \e[36mMEMORIZING IS FOR ROBOTS\e[0m ---"
    echo -e "\e[34m[System]\e[0m   localip, publicip, ports, wifi, path, reload"
    echo -e "\e[34m[Dev]\e[0m      i (install), clean, venv, activate"
    echo -e "\e[34m[Rice]\e[0m     conf-hypr, conf-fish, conf-nvim, conf-waybar"
    echo -e "\e[34m[Git]\e[0m      gs, gal, gac 'msg', gp, gl, glog"
    echo -e "\e[34m[Stack]\e[0m    b (bun), p (pnpm), n (node), d (docker)"
    echo -e "------------------------------------"
end

# =============================================================================
#  FILE & NAVIGATION
# =============================================================================
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias tree='lsd --tree'
alias cat='bat'
alias catp='bat -pp'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias hom='cd ~'
alias x='exit'
alias c='clear'
alias reload='source ~/.config/fish/config.fish && echo "Shell reloaded, Cuyy!"'
alias path='echo $PATH | tr " " "\n"'

# =============================================================================
#  ARCH LINUX
# =============================================================================
alias upd='sudo pacman -Syu'
alias aur='yay -Syu'
alias update='sudo pacman -Syu && yay -Syu'

abbr -a i 'sudo pacman -S'
abbr -a remove 'sudo pacman -Rns'
abbr -a search 'pacman -Ss'

function clean
    set orphans (pacman -Qtdq)
    if test -n "$orphans"
        sudo pacman -Rns $orphans
    else
        echo "Clean Cuyy: No orphan packages to remove."
    end
    yay -Sc
end

# =============================================================================
#  CYAN RICE
# =============================================================================
alias cv='cava'
alias pipes='pipes.sh'
alias clock='peaclock'
alias bonsai='cbonsai -l -b'
alias matrix='neo-matrix -D -a -s 15'

# =============================================================================
#  SYSTEM & NETWORK
# =============================================================================
alias df='duf'
alias mem='free -h --si'
alias top='htop'

alias localip='ip -c a'                      
alias publicip='curl -s https://ifconfig.me'
alias ports='sudo ss -tulanp'
alias wifi='nmcli device wifi list'
alias pingg='ping -c 5 google.com'       
alias header='curl -I'
abbr -a speedtest 'speedtest-cli' 

# =============================================================================
#  CONFIG ACCESS (Fast Edit)
# =============================================================================
alias conf-hypr='cd ~/.config/hypr/conf/ && nvim .'
alias conf-fish='nvim ~/.config/fish/config.fish'
alias conf-waybar='nvim ~/.config/waybar/config.jsonc'
alias conf-nvim='cd ~/.config/nvim/ && nvim .'

# =============================================================================
#  CYAN THEME COLORS
# =============================================================================
set -g fish_color_command 00ffff
set -g fish_color_param 00d7d7
set -g fish_color_keyword 008080
set -g fish_color_quote 5fffff
set -g fish_color_redirection d7ffff
set -g fish_color_error ff005f
set -g fish_color_end 00afaf
set -g fish_color_comment 005f5f
set -g fish_color_match --background=008080
set -g fish_color_search_match --background=005f5f
set -g fish_color_operator 00afaf
set -g fish_color_escape 00ffff
set -g fish_color_autosuggestion 005f5f

# =============================================================================
#  GIT
# =============================================================================
abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gal 'git add .'
abbr -a gc 'git commit -m'
abbr -a gp 'git push'
abbr -a gl 'git pull'
abbr -a gd 'git diff'
abbr -a gac 'git add . && git commit -m'
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# =============================================================================
#  DEV STACK (Bun, Pnpm, Node)
# =============================================================================
abbr -a b 'bun'
abbr -a bi 'bun install'
abbr -a br 'bun run'
abbr -a bx 'bun x'
abbr -a ba 'bun add'

abbr -a p 'pnpm'
abbr -a pi 'pnpm install'
abbr -a pr 'pnpm run'
abbr -a pa 'pnpm add'

abbr -a n 'node'
abbr -a ni 'npm install'
abbr -a nr 'npm run'

alias py='python'
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'

# =============================================================================
#  CONTAINERS (dk/pm)
# =============================================================================
# Docker (dk)
abbr -a dk 'docker'
abbr -a dkc 'docker-compose'
alias dkp='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dki='docker images'

function dkstop
    set containers (docker ps -q)
    test -n "$containers"; and docker stop $containers; or echo "No containers running, Cuyy."
end

# Podman (pm)
abbr -a pm 'podman'
abbr -a pmc 'podman-compose'
alias pmp='podman ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias pmi='podman images'

function pmstop
    set containers (podman ps -q)
    test -n "$containers"; and podman stop $containers; or echo "No containers running, Cuyy."
end
