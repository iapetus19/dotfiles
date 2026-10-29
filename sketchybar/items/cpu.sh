#!/bin/bash

cpu_top=(
  label.font="$FONT:Bold:7.0"
  label=CPU
  label.color=$ORANGE
  icon.drawing=off
  width=0
  padding_right=12
  y_offset=6
)

cpu_percent=(
  label.font="$FONT:Heavy:11.0"
  label.color=$YELLOW
  label="--%"
  y_offset=-4
  padding_right=12
  width=45
  icon.drawing=off
  update_freq=2
  mach_helper="$HELPER"
  click_script="open -a 'Activity Monitor'"
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=0x66e05a47
  label.drawing=off
  icon.drawing=off
  background.height=22
  background.drawing=on
  background.color=$TRANSPARENT
  background.border_width=0
)

cpu_user=(
  graph.color=$YELLOW
  graph.fill_color=0x66f6bd60
  label.drawing=off
  icon.drawing=off
  background.height=22
  background.drawing=on
  background.color=$TRANSPARENT
  background.border_width=0
)

sketchybar --add item cpu.top right                  \
           --set cpu.top "${cpu_top[@]}"             \
           --add item cpu.percent right              \
           --set cpu.percent "${cpu_percent[@]}"     \
           --add graph cpu.sys right 65              \
           --set cpu.sys "${cpu_sys[@]}"             \
           --add graph cpu.user right 65             \
           --set cpu.user "${cpu_user[@]}"
