#!/bin/bash

update() {
  source "$HOME/Developer/dotfiles/sketchybar/colors.sh"

  WS="${NAME#space.}"
  CURRENT=$(aerospace list-workspaces --focused 2>/dev/null)

  FOCUSED=false
  [ "$CURRENT" = "$WS" ] && FOCUSED=true

  if [ "$FOCUSED" = "true" ]; then
    BG_COLOR=$ORANGE
  else
    BG_COLOR=$BACKGROUND_1
  fi

  sketchybar --set "$NAME" \
    icon.highlight="$FOCUSED" \
    label.drawing=off \
    background.color="$BG_COLOR"
}

mouse_clicked() {
  WS="${NAME#space.}"
  aerospace workspace "$WS"
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked ;;
  *)               update ;;
esac
