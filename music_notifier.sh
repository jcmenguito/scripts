#!/bin/bash

# Listen for track changes or status updates
# --follow keeps the process alive even when players close/open
playerctl metadata --format '{{status}}: {{artist}} - {{title}}' --follow | while read -r line; do
    # Only notify if a song is actually playing
    if [[ "$line" == Playing* ]]; then
        # Remove the "Playing: " prefix for the notification
        song_info=$(echo "$line" | sed 's/^Playing: //')
        
        # Send to swaync via notify-send
        # -h string:x-canonical-private-synchronous:music replaces the previous song's notification
        notify-send -a "Music Player" -i "audio-x-generic" -h string:x-canonical-private-synchronous:music "Now Playing" "$song_info"
    fi
done
