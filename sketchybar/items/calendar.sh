#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Bold:12.0"
  icon.color=$BLACK
  icon.padding_left=10
  icon.padding_right=4
  label.width=96
  label.align=right
  label.color=$BLACK
  label.font="$FONT:Black:12.0"
  label.padding_right=10
  background.drawing=on
  background.color=$ICE_BLUE
  background.height=24
  background.corner_radius=6
  padding_left=8
  update_freq=1
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
