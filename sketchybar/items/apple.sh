#!/bin/bash

sketchybar --add item apple left \
           --set apple \
               icon="$APPLE" \
               icon.font="$FONT_APPLE" \
               icon.color="$WHITE" \
               label.drawing=off \
               padding_left=14 \
               padding_right=10
