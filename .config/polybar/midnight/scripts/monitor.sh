#!/usr/bin/bash

xinput list | grep Wacom | sed -n -e 's/^.*id=//p' | awk '{print $1}' | while read -r line ; do
    echo "Processing $line"
    xinput map-to-output $line DP-2
done

~/.config/polybar/midnight/launch.sh
