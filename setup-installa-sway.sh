#!/bin/bash

install --mode=555 wofi-menu.sh --target-dir=/bin/

pacman -Sy --needed sway swaylock swaybg swayimg swaync waybar swayidle sway-contrib gnome-terminal dmenu wmenu wofi ly

systemctl enable ly
