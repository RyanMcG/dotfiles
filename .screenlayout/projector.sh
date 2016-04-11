#!/bin/bash
xrandr \
	--output VGA-1 --off \
	--output HDMI-1 --off \
	--output DP-1 --mode 1280x1024 --pos 0x0 --rotate normal \
	--output eDP-1 --mode 1600x900 --pos 0x0 --rotate normal \
	--dpi 102
