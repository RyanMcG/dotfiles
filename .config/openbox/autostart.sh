#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

conky &
tint2 &

#Now our host specific autostart
if [ $ENABLE_COMPMGR = "yes" ]; then
	xcompmgr -cC &
fi

if [ -f ~/.config/autostart.sh ]; then
	. ~/.config/autostart.sh
fi
