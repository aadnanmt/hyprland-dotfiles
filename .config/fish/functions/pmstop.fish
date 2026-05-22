function pmstop --description 'Stop all running Podman containers'
    set -l containers (podman ps -q)
    if test -n "$containers"
        podman stop $containers
    else
        echo "Info: No running Podman containers found."
    end
end
