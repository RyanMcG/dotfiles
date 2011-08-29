#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

tint2 &
#urxvt -name urxvt-bg -e ncmpcpp &
Thunar --daemon &
conky &

#Now our host specific autostart
if [ $HOSTNAME = "arcbase" ]; then
	xcompmgr -cC &
fi
