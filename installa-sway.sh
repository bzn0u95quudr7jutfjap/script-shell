#!/bin/bash

sudo install --mode=555 wofi-menu.sh --target-dir=/bin/
sudo pacman -Sy --needed sway swaylock swaybg swayimg swaync waybar swayidle sway-contrib gnome-terminal dmenu wmenu wofi

mkdir -p "$HOME/.config/sway/"

cp ./swayconfig "$HOME/.config/sway/config"

