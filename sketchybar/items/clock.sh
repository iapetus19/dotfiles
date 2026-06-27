#!/bin/bash

sketchybar --add item clock right \
           --set clock \
               update_freq=10 \
               icon="$CLOCK" \
               icon.font="$FONT_ICON" \
               label.font="$FONT_LABEL" \
               icon.padding_left=8 \
               icon.padding_right=4 \
               label.padding_left=2 \
               label.padding_right=14 \
               script="$PLUGIN_DIR/clock.sh"
