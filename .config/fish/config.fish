

# Initial
if status is-interactive
    # Starship Prompt
    starship init fish | source
    
    # Remove greeting
    set -g fish_greeting ""
end

# pnpm
set -gx PNPM_HOME "/home/nanoo/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
