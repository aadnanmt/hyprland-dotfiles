# =============================================================================
#  ALIASES
# =============================================================================

# Safety
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

# Navigation & files
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias tree='lsd --tree'

if command -v bat > /dev/null
    alias cat='bat'
    alias catp='bat -pp'
else
    alias cat='command cat'
    alias catp='command cat'
end

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'
alias hom='cd ~'
alias x='exit'
alias c='clear'
alias reload='source ~/.config/fish/config.fish && echo "Shell reloaded, Cuyy!"'
alias path='echo $PATH | tr " " "\n"'

# TUI apps rice
alias menu='rofi -show drun -theme ~/.config/rofi/themes/cyan-cyber.rasi'
alias lg='lazygit'
alias lkd='lazydocker'
alias cv='cava'
alias pipes='pipes.sh -c 6 -c 4 -t 1 -f 60'
alias clock='peaclock --colour cyan'
alias bonsai='cbonsai -l -b'
alias matrix='neo-matrix -D -a -s 20 -c cyan'
alias top='btop'
alias htop='htop'

# System & network
alias df='duf'
alias mem='free -h --si'
alias localip='ip -c a'                      
alias publicip='curl -s https://ifconfig.me'
alias ports='sudo ss -tulanp'
alias wifi='nmcli device wifi list'
alias pingg='ping -c 5 google.com'       
alias header='curl -I'

# Config shortcuts
alias conf-hypr='cd ~/.config/hypr/conf/ && nvim .'
alias cf='nvim ~/.config/fish/config.fish'
alias cw='nvim ~/.config/waybar/config.jsonc'
alias cnvim='cd ~/.config/nvim/ && nvim .'
alias cr='nvim ~/.config/rofi/themes/cyan-cyber.rasi'
alias cl='nvim ~/.config/lazygit/config.yml'

# Python
alias py='python'
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'
