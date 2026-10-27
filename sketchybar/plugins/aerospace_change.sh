#!/bin/bash
WS="$AEROSPACE_FOCUSED_WORKSPACE"

# Immediate — updates all non-focused workspaces instantly
sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE="$WS"

# Delayed background — gives aerospace time to settle window list for focused workspace
(sleep 0.5 && sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE="$WS") &
