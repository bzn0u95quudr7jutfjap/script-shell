#!/bin/bash

pacman -Sy gdm
systemctl enable gdm

echo 'È necessario riavviare per confermare i cambiamenti'
