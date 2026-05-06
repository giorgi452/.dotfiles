#!/bin/bash

DND_STATUS=$(makoctl mode | grep -q "dnd" && echo "ON" || echo "OFF")
DND_TEXT="󰂛 Toggle Do Not Disturb (Current: $DND_STATUS)"
CLEAR_TEXT="󰎟 Clear All Notifications"

HISTORY=$(makoctl history | grep "Notification" | sed 's/Notification //')

LIST="$DND_TEXT\n$CLEAR_TEXT"
[[ -n "$HISTORY" ]] && LIST="$LIST\n--------------------------------------------------------------\n $HISTORY"

CHOICE=$(echo -e "$LIST" | rofi -dmenu \
    -p "Notifications" \
    -i \
    -theme-str 'window {width: 400px; height: 100%; anchor: east; location: east; x-offset: 0px; y-offset: 0px; border-radius: 0px;}' \
    -theme-str 'listview {lines: 20; border: 0px;}' )

case "$CHOICE" in
    "$DND_TEXT") makoctl mode -t dnd ;;
    "$CLEAR_TEXT") makoctl dismiss -a ;;
    "" | "---"*) exit ;;
    *) 
        NOTIF_ID=$(echo "$CHOICE" | cut -d':' -f1)
        if [[ "$NOTIF_ID" =~ ^[0-9]+$ ]]; then
            makoctl restore -i "$NOTIF_ID"
        fi
        ;;
esac
