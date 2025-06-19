#!/bin/bash

# Extract the wallpaper path from hyprpaper config
WALLPAPER=$(eval echo $(grep 'preload' ~/.config/hypr/hyprpaper.conf | cut -d '=' -f2- | xargs))

# Launch pywal
wal -i "$WALLPAPER"

sleep 0.5

~/.config/waybar/scripts/launch.sh