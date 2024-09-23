#!/bin/bash

sudo sh setup-installa-sway.sh

mkdir -p "$HOME/.config/sway/"
cp ./swayconfig "$HOME/.config/sway/config"

echo 'È necessario riavviare il sistema per confermare i cambiamenti'
