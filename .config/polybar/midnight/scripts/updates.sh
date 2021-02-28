#!/usr/bin/env bash

NOTIFY_ICON=/usr/share/icons/Qogir-ubuntu/32/apps/system-software-update.svg

get_total_updates() { UPDATES=$(checkupdates 2>/dev/null | wc -l); }

declare -i updatesold=0

while true; do
    get_total_updates

    # notify user of updates
    if hash notify-send &>/dev/null; then
        if (( UPDATES > 100 )); then
            notify-send -u critical -i $NOTIFY_ICON \
                "You really need to update!" "$UPDATES New packages."
        elif (( UPDATES > 50 )); then
            notify-send -u normal -i $NOTIFY_ICON \
                "You should update soon." "$UPDATES New packages."
        elif (( UPDATES > 10 )); then
            notify-send -u low -i $NOTIFY_ICON \
                "$UPDATES New packages."
        fi
    fi

    updatesold=$((UPDATES))

    # Only send a new notification when 5 additional updates arrived
    while (( UPDATES < updatesold + 5 )); do
        # when there are updates available
        if (( UPDATES > 0 )); then
            if (( UPDATES == 1 )); then
                echo " $UPDATES"
            elif (( UPDATES > 1 )); then
                echo " $UPDATES"
            else
                echo " None"
            fi
        fi

         # when no updates are available
         if (( UPDATES == 0 )); then
             echo " None"
        fi

        # wait 1min, then check again
	    sleep 60
	    get_total_updates
    done
done
