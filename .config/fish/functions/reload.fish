# ----------------------------------------------------- 
# --- RELOAD SHELL ---
# ----------------------------------------------------- 

function reload --wraps 'exec fish'
    exec fish $argv
end
