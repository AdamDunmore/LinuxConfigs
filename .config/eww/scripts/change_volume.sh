#!/usr/bin/env bash
volume=$(cat ~/.config/eww/misc/volume.txt)
rm ~/.config/eww/misc/volume.txt

if [ -z "$volume" ]; then
    echo "File Incorrect"
    volume=0
fi

if [ "$1" = "+" ]; then
    volume=$(expr $volume + 5)
elif [ "$1" = "-" ]; then
    volume=$(expr $volume - 5)
elif [ "$1" = "/" ]; then
    volume="0"
else
    volume="$1"
fi

if [ $volume -gt 100 ]; then
    volume="100"
elif [ $volume -lt 0 ]; then 
    volume="0"
fi

pactl set-sink-volume @DEFAULT_SINK@ $volume% 

echo "$volume" > ~/.config/eww/misc/volume.txt
