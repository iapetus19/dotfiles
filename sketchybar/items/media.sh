#!/bin/bash

# media item — center
# Shows front app when Spotify is idle, song info when playing.
# Clicking opens the Spotify popup.

sketchybar --add item media center \
           --set media \
               icon.drawing=off \
               label.font="$FONT_APP" \
               label.max_chars=40 \
               width=300 \
               update_freq=2 \
               script="$PLUGIN_DIR/media.sh" \
               click_script="sketchybar --set media popup.drawing=toggle" \
           --subscribe media front_app_switched

# ── Popup ──────────────────────────────────────────────────────────────
sketchybar --set media \
               popup.background.color="$POPUP_BACKGROUND" \
               popup.background.corner_radius=14 \
               popup.background.border_width=1 \
               popup.background.border_color=0x33ffffff \
               popup.blur_radius=30 \
               popup.y_offset=6

# Album art
sketchybar --add item media.art popup.media \
           --set media.art \
               icon.drawing=off \
               label.drawing=off \
               background.image.scale=0.5 \
               background.color=0x00000000 \
               background.height=80 \
               width=80 \
               padding_left=12 \
               padding_right=4

# Track title
sketchybar --add item media.title popup.media \
           --set media.title \
               icon.drawing=off \
               label.font="$FONT_POPUP_TITLE" \
               label.color="$WHITE" \
               label.max_chars=30 \
               padding_left=12 \
               padding_right=12

# Artist
sketchybar --add item media.artist popup.media \
           --set media.artist \
               icon.drawing=off \
               label.font="$FONT_POPUP_SUB" \
               label.color="$GREY" \
               label.max_chars=30 \
               padding_left=12 \
               padding_right=12

# Controls — prev
sketchybar --add item media.prev popup.media \
           --set media.prev \
               icon="$MEDIA_PREV" \
               icon.font="$FONT_ICON" \
               icon.color="$WHITE" \
               label.drawing=off \
               padding_left=16 \
               padding_right=4 \
               click_script="osascript -e 'tell application \"Spotify\" to previous track'"

# Controls — play/pause
sketchybar --add item media.playpause popup.media \
           --set media.playpause \
               icon="$MEDIA_PAUSE" \
               icon.font="$FONT_ICON" \
               icon.color="$WHITE" \
               label.drawing=off \
               padding_left=4 \
               padding_right=4 \
               click_script="osascript -e 'tell application \"Spotify\" to playpause'"

# Controls — next
sketchybar --add item media.next popup.media \
           --set media.next \
               icon="$MEDIA_NEXT" \
               icon.font="$FONT_ICON" \
               icon.color="$WHITE" \
               label.drawing=off \
               padding_left=4 \
               padding_right=16 \
               click_script="osascript -e 'tell application \"Spotify\" to next track'"
