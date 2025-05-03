#!/usr/bin/env bash
sudo pacman -Sy alacritty tmux zsh mako neovim hypridle hyprlock hyprpaper waybar hyprpolkitagent hyprsunset firefox spotify-launcher discord rofi wofi  neofetch 
echo "All the packages are installed."
stow --verbose --target=$$HOME --restow */
echo "All done."

