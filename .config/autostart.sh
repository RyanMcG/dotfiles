#!/bin/sh
#---- Autostart regardless of WM ----#

unclutter -idle 2 &
urxvtd &                #Runs rxvt-unicode deamon
#dropbox start &
start-pulseaudio-x11 &
gnome-keyring-daemon &
#padevchooser &
pnmixer &
nitrogen --restore &    #Restores wallpaper
xmodmap ~/.Xmodmap &
xset m 5 10 &
xset b off &
