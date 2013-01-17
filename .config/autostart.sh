#!/bin/sh
#---- Autostart regardless of WM ----#

start-pulseaudio-x11 &
unclutter -idle 2 &
dropbox start &
pnmixer &
xfce4-power-manager &
xmodmap ~/.Xmodmap &
udev-notify &
xset m 5 10 &
xset b off &
skippy-xd &
redshift -l 40:-83 -t 6000:4800 &
nitrogen --restore   #Restores wallpaper
