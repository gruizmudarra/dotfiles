#!/usr/bin/env bash
# Connect to a new WiFi network using wofi + nmcli

# List WiFi networks and let user pick one
bssid=$(nmcli device wifi list | sed -n '1!P' | cut -b 9- | \
    wofi --dmenu --prompt "  Select WiFi" --lines=10 | awk '{print $1}')

# Exit if nothing was chosen
[ -z "$bssid" ] && exit 1

# Ask for WiFi password
pass=$(wofi --dmenu --prompt "🔑 Enter password")

# Exit if password is empty
[ -z "$pass" ] && notify-send "🔑 Password not entered" && exit 1

# Try to connect
nmcli device wifi connect "$bssid" password "$pass" && \
    notify-send "📶 Connected to $bssid"
