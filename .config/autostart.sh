#!/bin/sh
#---- Autostart regardless of WM ----#

unclutter -idle 2 &
pnmixer &
netmon &
batti &
xmodmap ~/.Xmodmap &
udev-notify &
xset m 5 10 &
xset b off &
skippy-xd &
myredshift &
mycompton &
nitrogen --restore   #Restores wallpaper
