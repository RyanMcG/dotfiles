#!/bin/sh
#---- Autostart regardless of WM ----#

unclutter -idle 2 &
pnmixer &
xfce4-power-manager &
xmodmap ~/.Xmodmap &
udev-notify &
xset m 5 10 &
xset b off &
skippy-xd &
myredhsift &
nitrogen --restore   #Restores wallpaper
