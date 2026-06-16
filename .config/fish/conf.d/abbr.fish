# =============================================================================
#  ABBREVIATIONS
# =============================================================================

# Package Management (PACMAN)
abbr -a i 'sudo pacman -S'
abbr -a in 'sudo pacman -S'
abbr -a un 'sudo pacman -Rns'
abbr -a up 'sudo pacman -Syu'
abbr -a ss 'pacman -Ss'
abbr -a qs 'pacman -Qs'


# --- Package Management ---
abbr -a p 'paru'
abbr -a pi 'paru -S'
abbr -a pr 'paru -Rns'
abbr -a pu 'paru -Syu'
abbr -a ps 'paru -Ss'
abbr -a pq 'paru -Qs'

# --- Git Workflow & Navigation ---
abbr -a gs 'git status -sb'
abbr -a ga 'git add'
abbr -a gal 'git add .'
abbr -a gc 'git commit -m'
abbr -a gac 'git add . && git commit -m'
abbr -a gcan 'git commit --amend --no-edit'

# --- Git Syncing ---
abbr -a gp 'git push'
abbr -a gpl 'git pull'
abbr -a gpf 'git push --force-with-lease'

# --- Git Branching ---
abbr -a gco 'git checkout'
abbr -a gcb 'git checkout -b'
abbr -a gcm 'git checkout main'
abbr -a gsw 'git switch'
abbr -a gsm 'git switch main'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'

# --- Git Visual & Panic Buttons ---
abbr -a glo 'git log --graph --oneline --decorate --all'
abbr -a gundo 'git reset --soft HEAD~1'
abbr -a gnuke 'git reset --hard HEAD && git clean -fdx'


# --- Systemd & Power ---
abbr -a off 'sudo shutdown now'
abbr -a reb 'sudo reboot'
abbr -a susp 'systemctl suspend'

abbr -a ss 'sudo systemctl start'
abbr -a sx 'sudo systemctl stop'
abbr -a sr 'sudo systemctl restart'
abbr -a st 'systemctl status'
abbr -a se 'sudo systemctl enable --now'
abbr -a sd 'sudo systemctl disable --now'
abbr -a sl 'journalctl -u'

# --- Node Dev Stack (Bun & Pnpm) ---
# Bun
abbr -a b 'bun'
abbr -a bi 'bun install'
abbr -a br 'bun run'
abbr -a bx 'bun x'
abbr -a ba 'bun add'

# Pnpm
abbr -a pn 'pnpm'
abbr -a pni 'pnpm install'
abbr -a pnr 'pnpm run'
abbr -a pnx 'pnpm dlx'
abbr -a pna 'pnpm add'

# Containers (Podman)
abbr -a pm 'podman'
abbr -a pmc 'podman-compose'

# --- Modern Tools ---
abbr -a f 'fd'
abbr -a rg 'ripgrep'
abbr -a v 'nvim'
abbr -a .v 'nvim .'
