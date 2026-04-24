
# =============================================================================
#  ABBREVIATIONS
# =============================================================================

# Package management
abbr -a i 'sudo pacman -S'
abbr -a p-in 'sudo pacman -S'
abbr -a p-un 'sudo pacman -Rns'
abbr -a p-up 'sudo pacman -Syu'
abbr -a p-ss 'pacman -Ss'
abbr -a p-qs 'pacman -Qs'

abbr -a y-in 'yay -S'
abbr -a y-un 'yay -Rns'
abbr -a y-up 'yay -Syu'
abbr -a y-ss 'yay -Ss'

abbr -a pr-in 'paru -S'
abbr -a pr-un 'paru -Rns'
abbr -a pr-up 'paru -Syu'
abbr -a pr-ss 'paru -Ss'
abbr -a pruin 'paru -S'
abbr -a pruun 'paru -Rns'
abbr -a pruup 'paru -Syu'

# Git
abbr -a gs  'git status'
abbr -a ga  'git add'
abbr -a gal 'git add .'
abbr -a gc  'git commit -m'
abbr -a gac 'git add . && git commit -m'
abbr -a gp  'git push'
abbr -a gl  'git pull'
abbr -a gd  'git diff'
abbr -a gb  'git branch'
abbr -a gba 'git branch -a'
abbr -a gco 'git checkout'
abbr -a gcm 'git checkout main'
abbr -a gst 'git stash'
abbr -a gstp 'git stash pop'
abbr -a grv 'git remote -v'

# Systemd & power
abbr -a sys-off 'sudo shutdown now'
abbr -a sys-reboot 'sudo reboot'
abbr -a sys-suspend 'systemctl suspend'
abbr -a sys-logout 'hyprctl dispatch exit'
abbr -a sys-lock 'hyprlock'

abbr -a sc-start 'sudo systemctl start'
abbr -a sc-stop 'sudo systemctl stop'
abbr -a sc-restart 'sudo systemctl restart'
abbr -a sc-status 'systemctl status'
abbr -a sc-enable 'sudo systemctl enable --now'
abbr -a sc-disable 'sudo systemctl disable --now'
abbr -a sc-log 'journalctl -u'

# Dev stack

# bun
abbr -a b 'bun'
abbr -a bi 'bun install'
abbr -a br 'bun run'
abbr -a bx 'bun x'
abbr -a ba 'bun add'

# pnpm
abbr -a p 'pnpm'
abbr -a pi 'pnpm install'
abbr -a pr 'pnpm run'
abbr -a pa 'pnpm add'

#npm
abbr -a n 'node'
abbr -a ni 'npm install'
abbr -a nr 'npm run'

# Containers
abbr -a dk 'docker'
abbr -a dkc 'docker-compose'
abbr -a pm 'podman'
abbr -a pmc 'podman-compose'

# Search
abbr -a f 'fd'
abbr -a rg 'ripgrep'
