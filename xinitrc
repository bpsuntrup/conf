#!/bin/sh
# .xinitrc
#
# Copyright (C) Benjamin Paul Suntrup. All rights reserved.
# 
# This is a bash file that gets executed by xinit, which is executed, in turn
# by startx, which I'm currently starting in my .bash_profile (under specific,
# sane conditions).
# 
# For now there is no .xsession, because I do not use a display manager. I
# don't fully understand yet, but check out the following link for more
# information (last visited 2 Feb 2023):
#
# This looks for the window manager executable in the shell variable $WM, currently
# defaulting to i3. So to use a different window manager, justdo something like:
#
# WM=/bin/awesome startx
#
# https://unix.stackexchange.com/questions/281858/difference-between-xinitrc-xsession-and-xsessionrc
#
# TODO: learn when in the lifecycle of startx this is called. Looks like it's run after
#       the x server starts.

xwallpaper --zoom /home/benjamin/pix/bg/$(ls /home/benjamin/pix/bg | shuf | head -n 1)

# TODO: remove when not using dwm
statusbar &

#xrdb -merge /home/benjamin/.Xresources
xbindkeys # see .xbindkeysrc

if [[ "${WM:-dwm}" == dwm ]]; then
    nohup statusbar 2>&1 &
fi

# Swap caps and Escape
# setxkbmap -option caps:swapescape

# Make caps lock ESC when tapped, and CTRL when held:
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

firefox ~/README.txt &

exec ${WM:-dwm}
