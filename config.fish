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
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gac='git add . && git commit -m'
alias glog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

