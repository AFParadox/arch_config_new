#!/bin/bash

# Enable and start NetworkManager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Show available Wi-Fi networks
echo "Available Wi-Fi networks:"
nmcli dev wifi list

# Prompt user for Wi-Fi connection
read -p "Do you want to connect to a Wi-Fi network now? (y/n): " WIFI_ANSWER
if [[ "$WIFI_ANSWER" == "y" ]]; then
    read -p "Enter Wi-Fi SSID: " SSID
    read -s -p "Enter Wi-Fi password: " PASSWORD
    echo
    nmcli dev wifi connect "$SSID" password "$PASSWORD"
fi

# Install essential system packages via pacman
sudo pacman -S --needed greetd unzip networkmanager efibootmgr os-prober ntfs-3g git base-devel code 

# Clone and install yay (AUR helper)
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

# Install AUR packages via yay
yay -S --needed neofetch hyprpaper hyprlock brave-bin telegram-desktop nautilus man-db man-pages


# Clone configuration files
git clone https://github.com/AFParadox/arch_config_new
mkdir -p .config/
shopt -s dotglob  # Enable globbing for dotfiles in bash
mv -f arch_config_new/* .config/
shopt -u dotglob  # Disable dotglob if you want

# Hyprland should automatically pickup the configuration files
# Launch waybar
chmod +x ~/.config/waybar/scripts/launch.sh
~/.config/waybar/scripts/launch.sh

# Font installation
echo
cat <<'EOF'
===============================
⚠️  Setting up font ⚠️

- Download https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hasklig.zip.

===============================
EOF
echo

read -p "Press Enter when you have completed the manual steps to continue..."

cd Downloads/
unzip Hasklig.zip
sudo mv Hasklig /usr/share/fonts