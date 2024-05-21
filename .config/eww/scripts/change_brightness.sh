#!/usr/bin/env bash
brightness=$(cat ~/.config/eww/misc/brightness.txt)
rm ~/.config/eww/misc/brightness.txt

if [ -z "$brightness" ]; then
    echo "File Incorrect"
    brightness=0
fi

if [ "$1" = "+" ]; then
    brightness=$(expr $brightness + 5)
elif [ "$1" = "-" ]; then
    brightness=$(expr $brightness - 5)
else
    brightness="$1"
fi

if [ $brightness -gt 100 ]; then
    brightness="100"
elif [ $brightness -lt 0 ]; then 
    brightness="0"
fi

brightnessctl set $brightness%

echo "$brightness" > ~/.config/eww/misc/brightness.txt
