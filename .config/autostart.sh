#!/bin/sh
#---- Autostart regardless of WM ----#

nitrogen --restore &    #Restores wallpaper
#xmodmap ~/.Xmodmap &
xset m 5 10 &
urxvtd &                #Runs rxvt-unicode deamon
dropbox start &
