# .bashrc
#
# Copyright (C) Benjamin Paul Suntrup 2023. All rights reserved.
#
# Runs for non-login shells, but is sourced in ~/.bash_profile. See description
# in ~/.bash_profile for more information about the difference between these
# two files. Basically, .bash_profile runs once, this runs every time (kind of,
# not really).

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

command_not_found_handle () {
    echo "Command not found"
    echo "Arguments: $@"
}


source /home/benjamin/conf/lib/bash/buildmanpath.sh # exports MANPATH
source /home/benjamin/conf/lib/bash/ps1.sh          # exports PS1
source /home/benjamin/conf/lib/bash/lfi.sh          # lfi function and lf alias
source /home/benjamin/conf/lib/bash/status.sh       # exports status function
source /home/benjamin/conf/lib/bash/fvim.sh         # exports fvim function

alias ls='ls --color=auto'
alias tm='tmux attach'
alias wget='wget --hsts-file ${XDG_STATE_HOME}/wget/.wget-hsts'

export HISTCONTROL=ignoreboth
export MYBIN=$HOME/conf/bin
export PATH=$HOME/.plenv/bin:$HOME/.local/bin:/usr/lib/qt5/bin:/usr/local/pgsql/bin:$MYBIN:$PATH
export EDITOR=vim
export PAGER=less
export OPENER=opener

# XDG
export XDG_CONFIG_HOME=/home/benjamin/.config
export XDG_DESKTOP_DIR=/home/benjamin
export XDG_STATE_HOME=/home/benjamin/.local/state
export XDG_DATA_HOME=/home/benjamin/.local/share
export XDG_CACHE_HOME=/home/benjamin/.cache

# less
export LESSHISTFILE=${XDG_STATE_HOME}/less/history

# ~/bin
export INSTALL_LOG=$HOME/install-log.txt # used by bin/i
export DIARY=/home/benjamin/dox/diary

# PSQL
export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# plenv
eval "$(plenv init -)"

set -o vi
