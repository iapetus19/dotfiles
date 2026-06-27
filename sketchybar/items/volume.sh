#!/bin/bash

sketchybar --add item volume right \
           --set volume \
               icon.font="$FONT_ICON" \
               label.font="$FONT_LABEL" \
               icon.padding_left=8 \
               icon.padding_right=4 \
               label.padding_left=2 \
               label.padding_right=10 \
               script="$PLUGIN_DIR/volume.sh" \
           --subscribe volume volume_change
