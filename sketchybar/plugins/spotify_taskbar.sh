#!/bin/bash

# Get Spotify status
track_info=$(osascript <<EOF
tell application "Spotify"
  if it is running then
    try
      if player state is playing then
        set t_name to name of current track
        set t_artist to artist of current track
        return "󰎆 " & t_name & " by " & t_artist & "  ."
      else
        return "Not Playing ."
      end if
    on error
      return "Not Playing ."
    end try
  else
    return "Not Playing ."
  end if
end tell
EOF
)

sketchybar --set spotify.taskbar \
             spotify.taskbar_title label="$track_info"