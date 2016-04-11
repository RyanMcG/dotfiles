#!/bin/bash
xrandr \
	--output VGA-1 --off \
	--output HDMI-1 --off \
	--output DP-1 --off \
	--output eDP-1 --mode 1600x900 --pos 0x0 \
	--dpi 131
refresh-hud
