#!/bin/bash

# Enable dummy HDMI with provided resolution and refresh rate
xrandr --output HDMI-A-0 --mode ${SUNSHINE_CLIENT_WIDTH}x${SUNSHINE_CLIENT_HEIGHT} --rate ${SUNSHINE_CLIENT_FPS} --primary

# Disable physical monitor
xrandr --output DisplayPort-0 --off

# Mute audio
pactl set-sink-mute @DEFAULT_SINK@ 1
