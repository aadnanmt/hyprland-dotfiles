# ----------------------------------------------------- 
# --- ALIASES ---
# ----------------------------------------------------- 

# --- TUI Apps & Rice ---
alias pipes='pipes.sh -c 6 -c 4 -t 1 -f 60'
alias clock='peaclock --colour cyan'
alias bonsai='cbonsai -l -b'
alias matrix='neo-matrix -D -a -s 20 -c cyan'

# --- System & Network ---
alias wifi='nmcli device wifi list'
alias pingg='ping -c 5 google.com'       
alias header='curl -I'

# --- Config Shortcuts ---
alias cf='nvim ~/.config/fish/config.fish'
alias cw='nvim ~/.config/waybar/config.jsonc'
alias cr='nvim ~/.config/rofi/themes/cyan-cyber.rasi'
alias cl='nvim ~/.config/lazygit/config.yml'

# --- Python ---
alias venv='python -m venv .venv'
alias activate='source .venv/bin/activate.fish'
