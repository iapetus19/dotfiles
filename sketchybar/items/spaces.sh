#!/usr/bin/env bash
PLUGIN_DIR="$HOME/Developer/dotfiles2/sketchybar/plugins"

for ws in 1 2 3 4 5; do
  sketchybar --add item "space.$ws" left \
    --set "space.$ws" \
      display=1 \
      drawing=on \
      icon="$ws" \
      icon.highlight_color=$BLUE \
      label="" \
      label.drawing=on \
      label.highlight_color=$BLUE \
      label.font="SF Pro:Semibold:11.0" \
      background.border_color=$BACKGROUND_2 \
      background.height=26 \
      background.corner_radius=9 \
      background.border_width=2 \
      padding_left=$PADDINGS \
      padding_right=$PADDINGS \
      script="$PLUGIN_DIR/space.sh" \
      click_script="aerospace workspace ${ws}" \
    --subscribe "space.$ws" aerospace_workspace_change mouse.clicked front_app_switched system_woke
done

for ws in 6 7 8 9; do
  sketchybar --add item "space.$ws" left \
    --set "space.$ws" \
      display=2 \
      drawing=on \
      icon="$ws" \
      icon.highlight_color=$BLUE \
      label="" \
      label.drawing=on \
      label.highlight_color=$BLUE \
      label.font="SF Pro:Semibold:11.0" \
      background.border_color=$BACKGROUND_2 \
      background.height=26 \
      background.corner_radius=9 \
      background.border_width=2 \
      padding_left=$PADDINGS \
      padding_right=$PADDINGS \
      script="$PLUGIN_DIR/space.sh" \
      click_script="aerospace workspace ${ws}" \
    --subscribe "space.$ws" aerospace_workspace_change mouse.clicked front_app_switched system_woke
done
