paths=$(awk '/^manpath/ { print $2 }' /etc/man.conf)

for path in $paths; do
    if [[ -z "$MANPATH" ]]; then
       MANPATH=$path 
    else
       MANPATH=$MANPATH:$path
    fi
done

MANPATH=$MANPATH:${XDG_DATA_HOME:-$HOME/.local/share}/man

export MANPATH
