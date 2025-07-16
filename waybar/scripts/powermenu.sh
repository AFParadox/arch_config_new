#!/bin/bash

chosen=$(echo -e "Shutdown\nReboot\nLock\nSuspend\nLogout" | rofi -dmenu -i -p "Power")

case "$chosen" in
  Shutdown) systemctl poweroff ;;
  Reboot) systemctl reboot ;;
  Lock) hyprlock ;; # or betterlockscreen, i3lock, etc.
  Suspend) systemctl suspend ;;
  Logout) hyprctl dispatch exit ;; # for Hyprland, or `swaymsg exit` for sway
esac