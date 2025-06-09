#!/bin/bash

# Use for setting up my three monitors at work:
# A simpler solution is to use arandr, which is a gui, though
xrandr --output eDP-1 --right-of DP-1-2-8 --output DP-1-2-8 --primary --output DP-1-2-1-1 --left-of DP-1-2-8 --rotate right
