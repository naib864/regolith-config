#!/usr/bin/bash

rotation=$(xrandr --query --verbose | grep "eDP-1" | cut -d ' ' -f 6)

if [ "$rotation" = "normal" ]; then
    xrandr -o 2; xsetwacom set 16 Rotate half; xsetwacom set 9 Rotate half; xsetwacom set 10 Rotate half

else
    if [ "$rotation" = "inverted" ]; then
        xrandr -o 0; xsetwacom set 16 Rotate none; xsetwacom set 9 Rotate none; xsetwacom set 10 Rotate none
    fi
fi
