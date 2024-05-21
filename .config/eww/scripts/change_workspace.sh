#!/usr/bin/env bash
rm ~/.config/eww/misc/workspace.txt
echo "$1" > ~/.config/eww/misc/workspace.txt
hyprctl dispatch vdesk $1
