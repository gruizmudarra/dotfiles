#!/usr/bin/env bash

# List WiFi networks and select one with wofi
bssid=$(nmcli device wifi list | sed -n '1!P' | cut -b 9- | \
    wofi --dmenu --prompt "  WiFi" --lines=10 | awk '{print $1}')

# If nothing was selected, exit
[ -z "$bssid" ] && exit 1

# Connect to the chosen WiFi
nmcli device wifi connect "$bssid"
notify-send "📶 WiFi Connected to $bssid"
