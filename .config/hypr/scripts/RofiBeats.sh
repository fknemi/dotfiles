#!/bin/bash

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Define menu options as an associative array
declare -A menu_options=(
  #["<name>"]=<path>
)

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing now: $@"
}

# Function to stop mpv with --vid=no
stopmpv() {
  while read -r line; do
    if echo "$line" | grep -q -- "mpv.*--vid=no"; then
        pid=$(echo "$line" | awk '{print $2}')        
        kill $pid
    fi
  done < <(ps aux | grep mpv)
}

# Main function
main() {
  choice=$(printf "%s\n" "${!menu_options[@]}" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -i -p "")

  if [ -z "$choice" ]; then
    exit  1
  fi

  link="${menu_options[$choice]}"

  notification "$choice"
   
  if [[ $link == *playlist* ]]; then
    mpv --loop "$link"
  else
    mpv --loop --playlist="$link"
  fi
}

# Stop mpv processes with --vid=no and then either start a new mpv or notify
stopmpv
pkill -f http
main
