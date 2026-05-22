function dkstop --description 'Stop all running Docker containers'
    set -l containers (docker ps -q)
    if test -n "$containers"
        docker stop $containers
    else
        echo "Info: No running Docker containers found."
    end
end
