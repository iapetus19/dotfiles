#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:17.0"
  icon.padding_right=2
  label.font="$FONT:Bold:12.0"
  label.drawing=on
  padding_right=6
  padding_left=4
  update_freq=60
  updates=on
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
