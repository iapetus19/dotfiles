#!/bin/bash

# Called on front_app_switched for each launcher button.
# Highlights the button whose app is frontmost.

APP_MAP_DEV="Visual Studio Code"
APP_MAP_WEB="Arc"
APP_MAP_TERM="WezTerm"
APP_MAP_CHAT="WhatsApp"
APP_MAP_MEDIA="Spotify"

FRONT="$INFO"

for ITEM in DEV WEB TERM CHAT MEDIA; do
    VAR="APP_MAP_${ITEM}"
    TARGET="${!VAR}"

    if [ "$FRONT" = "$TARGET" ]; then
        sketchybar --set "$ITEM" \
            background.drawing=on \
            icon.color=0xff000000
    else
        sketchybar --set "$ITEM" \
            background.drawing=off \
            icon.color=0xffffffff
    fi
done
