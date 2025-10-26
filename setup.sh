#!/usr/bin/env bash
sudo pacman -Sy ghostty tmux zsh starship mako neovim hypridle hyprlock hyprpaper waybar wofi hyprpolkitagent hyprsunset spotify-launcher discord
echo "All the packages are installed."
stow --verbose --target=$HOME --restow */
echo "All done."

