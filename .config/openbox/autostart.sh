#!/bin/sh

#-----------------------------------------
#---- AutoStart Script for OpenBox -------
#-----------------------------------------

#Sets the wallpaper among other things.
if [ -f ~/.config/autostart.sh ]; then
	. ~/.config/autostart.sh
fi

conky &
tint2 &

export NODENAME=$(uname -n)
export ENABLE_COMPMGR="no"

if [[ $NODENAME == "arcbase" ]]; then
	export ENABLE_COMPMGR="yes"
elif [[ $NODENAME == "zenbook" ]]; then
	export ENABLE_COMPMGR="yes"
fi

#Now our host specific autostart
if [[ $ENABLE_COMPMGR == "yes" ]]; then
	compton -cGCb
fi
