#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
/home/roin/.config/autostart.sh &
# exec gnome-session
# exec startkde
# ...or the Window Manager of your choice
#exec ck-launch-session openbox-session
exec ck-launch-session startxfce4
#exec ck-launch-session dwm
#exec ck-launch-session wmii
#exec ck-launch-session xmonad
#exec ck-launch-session awesome
