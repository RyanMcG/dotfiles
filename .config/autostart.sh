#!/bin/sh
#---- Autostart regardless of WM ----#

unclutter -idle 2 &
pnmixer &
xmodmap ~/.Xmodmap &
udev-notify &
xset m 5 10 &
xset b off &
myredshift &
xss-lock slock &
nitrogen --restore   #Restores wallpaper
