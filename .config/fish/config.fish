# =============================================================================
#  INITIALIZATION
# =============================================================================
starship init fish | source
set -g fish_greeting "" # remove greeting fish shell

# =============================================================================
#  FILE & NAVIGATION (LSD & BAT)
# =============================================================================
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias tree='lsd --tree'
alias cat='bat'
alias catp='bat -pp' # no line  num

# Navigation shortcuts
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
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias cleanup='sudo pacman -Rns (pacman -Qtdq) && yay -Sc'
alias search='pacman -Ss'

# =============================================================================
#  RICE CUYY
# =============================================================================
alias cv='cava'
alias pipes='pipes.sh'
alias clock='peaclock'
alias bonsai='cbonsai -l -b'
alias matrix='neo-matrix -D -a -s 15'


# =============================================================================
#  SYSTEM MONITORING
# =============================================================================
alias df='duf'
alias mem='free -h --si'
alias top='htop'
alias bigfiles='expac -S "%-20n %m" | sort -nk2 | tail -n 20'

# =============================================================================
#  NETWORK MONITORING
# =============================================================================
alias ipa='ip -c a'                      
alias pingg='ping -c 5 google.com'       
alias myip='curl -s https://ifconfig.me'
alias ports='sudo ss -tulanp'
alias wifi='nmcli device wifi list'


# =============================================================================
#  CONFIG & DOTFILES RICE
# =============================================================================
alias conf-hypr='nano ~/.config/hypr/hyprland.conf'
alias conf-fish='nano ~/.config/fish/config.fish'
alias conf-waybar='nano ~/.config/waybar/config.jsonc'
alias rb-waybar='killall waybar && waybar &'

# =============================================================================
#  GIT CUSTOM COMMANDS
# =============================================================================
alias gs='git status'
alias ga='git add'
alias gal='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gf='git diff'
alias gf='git diff .'
alias gac='git add . && git commit -m'
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"


# =============================================================================
# Python
# =============================================================================
alias py='python'
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'
alias pip-install='pip install -r requirements.txt'
alias pip-freeze='pip freeze > requirements.txt'

# =============================================================================
# NPM
# =============================================================================
alias n='node'
alias ni='npm install'
alias nr='npm run'
alias ns='npm start'
alias nd='npm run dev'

# =============================================================================
# BUN
# =============================================================================
alias b='bun'
alias bi='bun install'
alias br='bun run'
alias bx='bun x'

# =============================================================================
# check
# =============================================================================
alias header='curl -I'
alias myip='curl -s https://ifconfig.me'
alias speedtest='curl -s https://githubusercontent.com | python'

#==============================================================================
# Sql
#==============================================================================
alias psql-up='sudo systemctl start postgresql'
alias psql-down='sudo systemctl stop postgresql'
alias redis-up='sudo systemctl start redis'
alias db-ls='sudo -u postgres psql -c "\l"'


#==============================================================================
# Podman Docker
# =============================================================================
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dimg='docker images'
alias dstop='docker stop (docker ps -q)'
alias dclean='docker system prune -a --volumes'

alias p='podman'
alias pc='podman-compose'
alias pps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias pimg='docker images'
alias pstop='docker stop (docker ps -q)'
alias pclean='docker system prune -a --volumes'
