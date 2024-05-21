#!/usr/bin/env bash

#CHANGE TO BETTER SOLUTION LATER
monitors=$(hyprctl monitors | grep "Monitor")
if [ "$monitors" = "Monitor eDP-1 (ID 0):" ]; then
    monitor=0
else 
    monitor=1
fi

(eww open bar --screen ${monitor}) 
