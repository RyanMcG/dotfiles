#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

#Sets the wallpaper
if [ -f ~/.config/autostart.sh ]; then
	. ~/.config/autostart.sh
fi

conky &
tint2 &

#Now our host specific autostart
if [ $ENABLE_COMPMGR = "yes" ]; then
	compton -cC &
fi
