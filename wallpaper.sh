#!/bin/bash

# Wait for the swww socket to exist. Please check the actual name of the swww-daemon socket in your system
while [ ! -S "$XDG_RUNTIME_DIR/${WAYLAND_DISPLAY}-swww-daemon..sock" ]; do
    sleep 0.1
done

# Optional: Extra check to ensure daemon is responding
until swww query &>/dev/null; do
    sleep 0.1
done

# Start of wallpaper setting routine
while : ; do
	for file in $(find ~/Pictures/Wallpapers -type f -iregex ".*\.\(jpg\|png\)$" | shuf); do
		swww img "$file" --transition-type random
		sleep 1m
	done
done
