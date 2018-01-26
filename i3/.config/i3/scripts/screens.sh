#!/bin/sh

xrandr --output HDMI1 --off --output eDP1 --auto

i3-nagbar -m "Select desired screen configuration" -t warning \
	-b "eDP1 + HDMI"  "xrandr --output eDP1 --auto --output HDMI1 --auto --above eDP1" \
	-b "HDMI1 ONLY"    "xrandr --output eDP1 --off --output HDMI1 --auto"

sh ~/.fehbg
