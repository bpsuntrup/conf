#!/bin/sh

emoji=${EMOJI_FILE:-$HOME/conf/emoji.txt}


cat $emoji | dmenu -i -fn 'Inconsolata' -l 15 | perl -ne 'chomp; s/ .*$//; print' | clipin
