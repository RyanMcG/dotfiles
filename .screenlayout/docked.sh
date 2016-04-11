#!/bin/bash
xrandr \
	--output VGA-1 --off \
	--output HDMI-1 --mode 1920x1080 --pos 1600x0 \
	--output DP-1 --off \
	--output eDP-1 --mode 1600x900 --pos 0x240 \
	--dpi 102
refresh-hud
