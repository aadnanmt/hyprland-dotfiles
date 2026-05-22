# ----------------------------------------------------- 
# --- FISH CONFIGURATION ---
# ----------------------------------------------------- 

# --- Initialization ---
if status is-interactive
    # Starship Prompt
    starship init fish | source
    
    # Remove greeting
    set -g fish_greeting ""
end
