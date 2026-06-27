#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

[ "$SENDER" != "volume_change" ] && exit 0

VOLUME="$INFO"

if [ "$VOLUME" -eq 0 ]; then
    ICON="$VOLUME_MUTED"
elif [ "$VOLUME" -lt 35 ]; then
    ICON="$VOLUME_LOW"
elif [ "$VOLUME" -lt 70 ]; then
    ICON="$VOLUME_MEDIUM"
else
    ICON="$VOLUME_HIGH"
fi

sketchybar --set "$NAME" icon="$ICON" label="${VOLUME}%"
