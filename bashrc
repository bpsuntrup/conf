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

# command_not_found_handle () {
#     echo "Command not found"
#     echo "Arguments: $@"
# }


source $HOME/conf/lib/bash/buildmanpath.sh # exports MANPATH
source $HOME/conf/lib/bash/ps1.sh          # exports PS1
source $HOME/conf/lib/bash/lfi.sh          # lfi function and lf alias
source $HOME/conf/lib/bash/status.sh       # exports status function

alias ls='ls --color=auto'
alias tm='tmux attach'
alias wget='wget --hsts-file ${XDG_STATE_HOME}/wget/.wget-hsts'
alias sa=ssh-add
alias ga="git add --all"
alias gc="git commit -m "
alias gs="git status"

export HISTCONTROL=ignoreboth
export MYBIN=$HOME/conf/bin
export PATH=$HOME/.plenv/bin:$HOME/.local/bin:/usr/lib/qt5/bin:/usr/local/pgsql/bin:$MYBIN:$PATH
#export PATH=$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH
export EDITOR=vim
export PAGER=less
export OPENER=opener
export BROWSER=firefox

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DESKTOP_DIR=$HOME
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# less
export LESSHISTFILE=${XDG_STATE_HOME}/less/history

# ~/bin
export INSTALL_LOG=$HOME/install-log.txt # used by bin/i
export DIARY=$HOME/dox/diary

# PSQL
# export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
# export PSQL_HISTORY="$XDG_STATE_HOME/psql_history"
# export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
# export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

# plenv
eval "$(plenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - bash)"   # use - zsh if zsh


set -o vi

# work stuff
export KUBECONFIG=$HOME/rke-apps-dev.yml
export LOCAL_ENV=dev
eval $(ssh-agent)

command_not_found_handle () {
    >&2 echo "-bash: $1: command not found"
    if [[ "x$MY_OS" == "xvoid" ]]; then
        >&2 echo "Install $1 with one of these packages: "
        xlocate "/$1$" | cut -d ' ' -f 1 | >&2 uniq
    fi
}


# site stuff
source $HOME/conf/site.sh

# [ -f "/home/benjamin/.local/.ghcup/env" ] && . "/home/benjamin/.local/.ghcup/env" # ghcup-env
