#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

PERCENT=$(pmset -g batt | grep -Eo '[0-9]+%' | tr -d '%')
[ -z "$PERCENT" ] && exit 0

if pmset -g batt | grep -q "AC Power"; then
    ICON="$BATTERY_CHARGING"
elif [ "$PERCENT" -ge 90 ]; then
    ICON="$BATTERY_FULL"
elif [ "$PERCENT" -ge 60 ]; then
    ICON="$BATTERY_75"
elif [ "$PERCENT" -ge 30 ]; then
    ICON="$BATTERY_50"
else
    ICON="$BATTERY_LOW"
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENT}%"
