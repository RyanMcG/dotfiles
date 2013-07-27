#!/bin/sh
#---- Autostart regardless of WM ----#

unclutter -idle 2 &
pnmixer &
netmon &
xfce4-power-manager &
xmodmap ~/.Xmodmap &
udev-notify &
xset m 5 10 &
xset b off &
skippy-xd &
myredhsift &
mycompton &
nitrogen --restore   #Restores wallpaper
