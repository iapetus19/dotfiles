#!/bin/bash

# Remove existing items (if reloading)
sketchybar --remove spotify.taskbar_icon
sketchybar --remove spotify.taskbar_title
sketchybar --remove spotify.taskbar

# Main container item
sketchybar --add item spotify.taskbar right \
           --set spotify.taskbar \
                 script="$PLUGIN_DIR/spotify_taskbar.sh" \
                 update_freq=5 \
                 background.color=$BAR_COLOR \
                 background.corner_radius=9 \
                 background.border_width=2 \
                 background.border_color=$BAR_BORDER_COLOR \
                 background.padding_left=20 \
                 background.padding_right=20 \
                 background.drawing=on

# Track text item
sketchybar --add item spotify.taskbar_title inside spotify.taskbar \
           --set spotify.taskbar_title \
                 label.font="$FONT:Bold:12.0" \
                 label.padding_left=5 \
                 label.padding_right=5 \
                 align=center \
                 y_offset=0 \
                 label=""
