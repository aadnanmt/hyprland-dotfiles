# =============================================================================
#  INITIALIZATION
# =============================================================================

# Starship
starship init fish | source

# remove fish shell greeting
set -g fish_greeting ""

# =============================================================================
#  FILE & NAVIGATION SEDERHANA
# =============================================================================
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias tree='lsd --tree'
alias cat='bat' # line number
alias catp='bat -pp' # no line number

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias hom='cd ~'
alias x='exit'
alias c='clear'

# =============================================================================
#  ARCH LINUX & PACKAGE MANAGEMENT
# =============================================================================
alias upd='sudo pacman -Syu'
alias aur='yay -Syu'
alias update='sudo pacman -Syu && yay -Syu'

# i use abbr for command argument
abbr -a install 'sudo pacman -S'
abbr -a remove 'sudo pacman -Rns'
abbr -a search 'pacman -Ss'

# Safe cleanup function
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
#  RICE CUYY
# =============================================================================
alias cv='cava'
alias pipes='pipes.sh'
alias clock='peaclock'
alias bonsai='cbonsai -l -b'
alias matrix='neo-matrix -D -a -s 15'

# =============================================================================
#  SYSTEM & NETWORK MONITORING
# =============================================================================
alias df='duf'
alias mem='free -h --si'
alias top='htop'

alias ipa='ip -c a'                      
alias pingg='ping -c 5 google.com'       
alias myip='curl -s https://ifconfig.me'
alias port='sudo ss -tulanp'
alias wifi='nmcli device wifi list'
alias header='curl -I'
# i change to speedtest-cli
abbr -a speedtest 'speedtest-cli' 

# =============================================================================
#  CONFIG & DOTFILES RICE
# =============================================================================
alias conf-hypr='cd ~/.config/hypr/conf/ && nvim .'
alias conf-fish='nvim ~/.config/fish/config.fish'
alias conf-waybar='nvim ~/.config/waybar/config.jsonc'
alias conf-nvim='cd ~/.config/nvim/ && nvim .'

# =============================================================================
#  CYAN COLOR SCHEME (Syntax Highlighting)
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
#  GIT (ABBR version)
# =============================================================================
abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a gal 'git add .'
abbr -a gc 'git commit -m'
abbr -a gp 'git push'
abbr -a gl 'git pull'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached' # add diff cached
abbr -a gac 'git add . && git commit -m'
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# =============================================================================
# EDGE STACK (Bun, Hono, Turso, Cloudflare,dll)
# =============================================================================
abbr -a b 'bun'
abbr -a bi 'bun install'
abbr -a br 'bun run'
abbr -a bx 'bun x'

abbr -a n 'node'
abbr -a ni 'npm install'
abbr -a nr 'npm run'
abbr -a ns 'npm start'
abbr -a nd 'npm run dev'

abbr -a wd 'wrangler dev'
abbr -a wp 'wrangler pages deploy'
abbr -a db 'turso db shell'

# =============================================================================
# Python
# =============================================================================
alias py='python'
alias py3='python3'
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'
abbr -a pip-install 'pip install -r requirements.txt'
abbr -a pip-freeze 'pip freeze > requirements.txt'

#==============================================================================
# SERVICE DB
#==============================================================================
alias psql-up='sudo systemctl start postgresql'
alias psql-down='sudo systemctl stop postgresql'
alias redis-up='sudo systemctl start redis'

#==============================================================================
# Container (Docker & Podman)
# =============================================================================
abbr -a d 'docker'
abbr -a dc 'docker-compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dimg='docker images'
alias dclean='docker system prune -a --volumes'

function dstop
    set containers (docker ps -q)
    if test -n "$containers"
        docker stop $containers
    else
        echo "FYI: No running docker container, cuyy."
    end
end

abbr -a p 'podman'
abbr -a pc 'podman-compose'
alias pps='podman ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias pimg='podman images'
alias pclean='podman system prune -a --volumes'

function pstop
    set containers (podman ps -q)
    if test -n "$containers"
        podman stop $containers
    else
        echo "FYI: No running podman container, cuyyy."
    end
end
