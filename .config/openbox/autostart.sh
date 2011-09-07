#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

conky &
tint2 &

#Now our host specific autostart
if [ $HOSTNAME = "arcbase" ]; then
	xcompmgr -cC &
fi
