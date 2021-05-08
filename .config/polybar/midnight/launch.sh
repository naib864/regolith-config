#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/midnight"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q top -c "$DIR"/config.ini &
polybar -q bottom -c "$DIR"/config.ini &
polybar -q top2 -c "$DIR"/config.ini &
polybar -q bottom2 -c "$DIR"/config.ini &


#for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar -q top -c "$DIR"/config.ini & polybar -q bottom -c "$DIR"/config.ini & done
