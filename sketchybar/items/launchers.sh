#!/bin/bash

APPS=(
    "DEV:Visual Studio Code"
    "WEB:Arc"
    "TERM:WezTerm"
    "CHAT:WhatsApp"
    "MEDIA:Spotify"
)

for ENTRY in "${APPS[@]}"; do
    NAME="${ENTRY%%:*}"
    APP="${ENTRY##*:}"

    sketchybar --add item "$NAME" left \
               --set "$NAME" \
                   icon="$NAME" \
                   icon.font="$FONT_WORKSPACE" \
                   icon.color="$WHITE" \
                   label.drawing=off \
                   background.drawing=off \
                   background.color="$WHITE" \
                   background.corner_radius=12 \
                   background.height=30 \
                   icon.padding_left=14 \
                   icon.padding_right=14 \
                   click_script="open -a \"$APP\"" \
               --subscribe "$NAME" front_app_switched
done

# Highlight watcher — fires on every front_app_switched
sketchybar --add item app_highlight left \
           --set app_highlight \
               drawing=off \
               script="$PLUGIN_DIR/app_highlight.sh" \
           --subscribe app_highlight front_app_switched
