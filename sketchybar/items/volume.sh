#!/bin/bash

CURRENT_VOL=$(osascript -e 'output volume of (get volume settings)')

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$YELLOW
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$BACKGROUND_1
  slider.knob=􀀁
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=6
  padding_right=4
  icon=$VOLUME_100
  icon.color=$ORANGE
  icon.font="$FONT:Regular:14.0"
  icon.padding_right=3
  label="${CURRENT_VOL}%"
  label.color=$WHITE
  label.font="$FONT:Bold:12.0"
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                              mouse.entered     \
                              mouse.exited      \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"
