#!/bin/bash

# Wait for the swww socket to exist
while [ ! -S "$XDG_RUNTIME_DIR/${WAYLAND_DISPLAY}-swww-daemon..sock" ]; do
    sleep 0.1
done

# Optional: Extra check to ensure daemon is responding
until swww query &>/dev/null; do
    sleep 0.1
done

while : ; do
	for file in $(ls ~/Videos/animatedWall/*.gif | shuf); do
		swww img "$file" --transition-type random		
		sleep 10m
	done
done

