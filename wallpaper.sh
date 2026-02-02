#!/bin/bash

# change ~/Pictures/Wallpapers if you keep your wallpapers in another
# directory.
while : ; do
	for file in $(find ~/Pictures/Wallpapers -type f -iregex ".*\.\(jpg\|png\)$" | shuf); do
		swww img "$file" --transition-type random
		sleep 1m
	done
done
