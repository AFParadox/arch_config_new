#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"

# Pick a random image
RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

# Get monitor names
MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Create the hyprpaper config
echo "preload = $RANDOM_WALLPAPER" > "$CONFIG_PATH"
for MON in $MONITORS; do
    echo "wallpaper = $MON,$RANDOM_WALLPAPER" >> "$CONFIG_PATH"
done

# Symlink for automatic sync of hyprlock wallpaper
ln -sf $RANDOM_WALLPAPER ~/.cache/current_wallpaper.jpg

wal -i "$RANDOM_WALLPAPER"

hyprpaper &

sleep 1

waybar &