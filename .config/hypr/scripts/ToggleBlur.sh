#!/bin/bash

## Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"

#STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

# if [ "${STATE}" == "2" ]; then
# 	hyprctl keyword decoration:blur:size 2
# 	hyprctl keyword decoration:blur:passes 1
#  	notify-send -e -u low -i "$notif" "Less blur"
# else
# 	hyprctl keyword decoration:blur:size 5
# 	hyprctl keyword decoration:blur:passes 2
#   	notify-send -e -u low -i "$notif" "Normal blur"
# fi

STATE=$(hyprctl -j getoption decoration:blur:enabled | jq ".int")

if [ $STATE -eq 1 ]; then
	hyprctl keyword decoration:blur:enabled false
	notify-send -i $notif "Blur" "Disabled"
else
	hyprctl keyword decoration:blur:enabled true
	notify-send -i $notif "Blur" "Enabled"
fi