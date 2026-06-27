#!/bin/bash

sketchybar --add item battery right \
           --set battery \
               update_freq=60 \
               icon.font="$FONT_ICON" \
               label.font="$FONT_LABEL" \
               icon.padding_left=8 \
               icon.padding_right=4 \
               label.padding_left=2 \
               label.padding_right=10 \
               script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
