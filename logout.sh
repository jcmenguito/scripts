#!/bin/bash
# Check the running wayland compositor
compositor=$(pgrep -l "hyprland|labwc" | cut -f 2 -d " ")

if [ $compositor == start-hyprland ]; then
	exec hyprctl dispatch exit
else
	exec labwc --exit
fi
