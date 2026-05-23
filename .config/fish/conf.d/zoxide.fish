# ----------------------------------------------------- 
# --- ZOXIDE CONFIGURATION ---
# ----------------------------------------------------- 

# --- Initialization ---
# zoxide: a smarter cd command for your shell.
# Usage: z <path> or zi (interactive selection)
if command -v zoxide > /dev/null
    zoxide init fish | source
end
