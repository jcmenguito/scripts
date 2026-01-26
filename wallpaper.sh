#!/bin/bash
cd ~/Pictures/Wallpapers/Wallpaper-Bank/swww/
while : ; do
	for file in $(ls *.{png,jpg,jpeg} | shuf); do
		swww img "$file" --transition-type random
		sleep 1m
	done
done

