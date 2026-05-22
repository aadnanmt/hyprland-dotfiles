# ----------------------------------------------------- 
# --- ABBREVIATIONS ---
# ----------------------------------------------------- 

# --- Git (Standardized & Efficient) ---
abbr -a gs 'git status'
abbr -a ga 'git add'
abbr -a ga. 'git add .'
abbr -a gc 'git commit -m'
abbr -a gac 'git add . && git commit -m' # the "tazy dev" special🗿
abbr -a gp 'git push'
abbr -a gl 'git pull'
abbr -a gco 'git checkout'
abbr -a gcm 'git checkout main'
abbr -a gd 'git diff'

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

# --- Dev Stack (Prioritize Bun & Pnpm) ---
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
abbr -a pna 'pnpm add'

# Containers (Podman over Docker)
abbr -a pm 'podman'
abbr -a pmc 'podman-compose'

# --- Modern Tools ---
abbr -a f 'fd'
abbr -a rg 'ripgrep'
abbr -a v 'nvim'
