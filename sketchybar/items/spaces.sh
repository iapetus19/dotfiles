#!/usr/bin/env bash
PLUGIN_DIR="$HOME/Developer/dotfiles/sketchybar/plugins"

for ws in 1 2 3 4 5; do
  sketchybar --add item "space.$ws" left \
    --set "space.$ws" \
      display=1 \
      drawing=on \
      icon="$ws" \
      icon.padding_left=8 \
      icon.padding_right=8 \
      icon.color=$WHITE \
      icon.highlight_color=$BLACK \
      label.drawing=off \
      background.drawing=on \
      background.color=$BACKGROUND_1 \
      background.height=24 \
      background.corner_radius=6 \
      background.border_width=0 \
      padding_left=2 \
      padding_right=2 \
      script="$PLUGIN_DIR/space.sh" \
      click_script="aerospace workspace ${ws}" \
    --subscribe "space.$ws" aerospace_workspace_change mouse.clicked system_woke
done

for ws in 6 7 8 9; do
  sketchybar --add item "space.$ws" left \
    --set "space.$ws" \
      display=2 \
      drawing=on \
      icon="$ws" \
      icon.padding_left=8 \
      icon.padding_right=8 \
      icon.color=$WHITE \
      icon.highlight_color=$BLACK \
      label.drawing=off \
      background.drawing=on \
      background.color=$BACKGROUND_1 \
      background.height=24 \
      background.corner_radius=6 \
      background.border_width=0 \
      padding_left=2 \
      padding_right=2 \
      script="$PLUGIN_DIR/space.sh" \
      click_script="aerospace workspace ${ws}" \
    --subscribe "space.$ws" aerospace_workspace_change mouse.clicked system_woke
done
