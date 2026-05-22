# =============================================================================
#  PATH & ENVIRONMENT VARIABLES
# =============================================================================

# Bun
set -gx BUN_INSTALL "$HOME/.bun"
if not string match -q -- $BUN_INSTALL/bin $PATH
  set -gx PATH "$BUN_INSTALL/bin" $PATH
end

# Default apps
set -gx EDITOR nano
set -gx VISUAL nvim
set -gx TERMINAL kitty

# Manpages in color
if command -v bat > /dev/null
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

# Fix gpg tty
set -gx GPG_TTY (tty)

# Encoding
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
