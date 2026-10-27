#!/bin/bash

update() {
  source "$HOME/Developer/dotfiles2/sketchybar/colors.sh"

  WS="${NAME#space.}"

  # Ask aerospace directly at runtime — don't trust the trigger env var
  CURRENT=$(aerospace list-workspaces --focused 2>/dev/null)

  FOCUSED=false
  [ "$CURRENT" = "$WS" ] && FOCUSED=true

  # --focused flag queries differently than --workspace $WS internally
  # --workspace $WS has a timing race on the active space, --focused does not
  if [ "$FOCUSED" = "true" ]; then
    WINS=$(aerospace list-windows --focused 2>/dev/null)
  else
    WINS=$(aerospace list-windows --workspace "$WS" 2>/dev/null)
  fi

  APPS=$(echo "$WINS" \
    | awk -F'|' '{gsub(/^ +| +$/, "", $2); print $2}' \
    | sort -u \
    | tr '\n' '·' \
    | sed 's/·$//' \
    | sed 's/·/ · /g')

  COLOR=$BACKGROUND_2
  [ "$FOCUSED" = "true" ] && COLOR=$WHITE

  sketchybar --set "$NAME" \
    icon.highlight="$FOCUSED" \
    label="$APPS" \
    label.drawing=on \
    label.highlight="$FOCUSED" \
    background.border_color="$COLOR"
}

mouse_clicked() {
  WS="${NAME#space.}"
  aerospace workspace "$WS"
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked ;;
  *)               update ;;
esac
