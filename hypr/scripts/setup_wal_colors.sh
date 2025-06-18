#!/bin/bash

waypaper --random --folder ~/Pictures/wallpapers/

sleep 0.5

# Extract the wallpaper path from Waypaper config
WALLPAPER=$(eval echo $(grep '^wallpaper' ~/.config/waypaper/config.ini | cut -d '=' -f2- | xargs))

# Launch pywal
wal -i "$WALLPAPER"

sleep 0.5

~/.config/waybar/scripts/launch.sh