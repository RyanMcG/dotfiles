#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

tint2 &
#urxvt -name urxvt-bg -e ncmpcpp &
volwheel&
Thunar --daemon &
conky &

#Now our host specific autostart
./autostart_extra.sh &
