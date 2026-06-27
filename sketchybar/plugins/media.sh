#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

SPOTIFY_RUNNING=$(osascript -e 'application "Spotify" is running' 2>/dev/null)

if [ "$SPOTIFY_RUNNING" = "true" ]; then
    STATE=$(osascript -e 'tell application "Spotify" to player state as string' 2>/dev/null)
else
    STATE="stopped"
fi

if [ "$STATE" = "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track' 2>/dev/null)
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track' 2>/dev/null)
    ART_URL=$(osascript -e 'tell application "Spotify" to artwork url of current track' 2>/dev/null)

    # Download art only if track changed
    ART_CACHE="/tmp/spotify_art.jpg"
    TRACK_CACHE="/tmp/spotify_last_track"
    LAST_TRACK=$(cat "$TRACK_CACHE" 2>/dev/null)

    if [ "$TRACK" != "$LAST_TRACK" ]; then
        curl -s -o "$ART_CACHE" "$ART_URL" 2>/dev/null
        echo "$TRACK" > "$TRACK_CACHE"
        sketchybar --set media.art background.image="$ART_CACHE"
    fi

    sketchybar --set media \
        icon.drawing=on \
        icon="$MEDIA_NOTE" \
        label="${TRACK} • ${ARTIST}"

    sketchybar --set media.title label="$TRACK"
    sketchybar --set media.artist label="$ARTIST"
    sketchybar --set media.playpause icon="$MEDIA_PAUSE"

else
    sketchybar --set media popup.drawing=off

    if [ "$STATE" = "paused" ]; then
        sketchybar --set media.playpause icon="$MEDIA_PLAY"
    fi

    if [ "$SENDER" = "front_app_switched" ]; then
        APP="$INFO"
    else
        APP=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)
    fi

    sketchybar --set media \
        icon.drawing=off \
        label="$APP"
fi
