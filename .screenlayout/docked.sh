#!/bin/bash
xrandr \
	--output HDMI-1 --auto --right-of eDP-1 \
	--dpi 102
refresh-hud
