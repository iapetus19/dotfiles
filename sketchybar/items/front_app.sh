#!/bin/bash

CURRENT_APP=$(lsappinfo info -only name $(lsappinfo front) | cut -d'"' -f4)
[ -z "$CURRENT_APP" ] && CURRENT_APP="Finder"

FRONT_APP_SCRIPT='[ -n "$INFO" ] && sketchybar --set $NAME label="$INFO"'

front_app=(
  script="$FRONT_APP_SCRIPT"
  icon.drawing=off
  label="$CURRENT_APP"
  label.color=$BLACK
  label.font="$FONT:Black:12.0"
  label.padding_left=10
  label.padding_right=10
  background.drawing=on
  background.color=$YELLOW
  background.height=24
  background.corner_radius=6
  padding_left=6
  associated_display=active
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched
