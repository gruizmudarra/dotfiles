#!/bin/bash

# Unmute audio
pactl set-sink-mute @DEFAULT_SINK@ 0

# Restore physical monitor
xrandr --output DisplayPort-0 --mode 2560x1440 --rate 143.97 --primary

# Disable dummy HDMI
xrandr --output HDMI-A-0 --off
