#!/bin/sh
#---- Autostart regardless of WM ----#

start-pulseaudio-x11 &
gnome-keyring-daemon &
unclutter -idle 2 &
urxvtd &                #Runs rxvt-unicode deamon
dropbox start &
#padevchooser &
pnmixer &
xfce4-power-manager &
xmodmap ~/.Xmodmap &
xset m 5 10 &
xset b off &
skippy-xd &
xflux -z 43201 &
nitrogen --restore   #Restores wallpaper
