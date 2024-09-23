#!/bin/bash

sudo sh setup-installa-sway.sh

mkdir -p "$HOME/.config/sway/"
cp ./swayconfig "$HOME/.config/sway/config"

printf 'Riavviare adesso ? [s/N]: '
read Y
printf 'Y:{%s}' "Y"
