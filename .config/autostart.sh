#!/bin/sh
#---- Autostart regardless of WM ----#

start-pulseaudio-x11 &
unclutter -idle 2 &
urxvtd &                #Runs rxvt-unicode deamon
dropbox start &
pnmixer &
xfce4-power-manager &
xmodmap ~/.Xmodmap &
xset m 5 10 &
xset b off &
skippy-xd &
xflux -z 43201 &
nitrogen --restore   #Restores wallpaper
