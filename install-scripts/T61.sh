#!/usr/bin/bash

# replace module definitions
sudo mv ~/.config/polybar/midnight/modules/network-T61.ini ~/.config/polybar/midnight/modules/network.ini
sudo mv ~/.config/polybar/midnight/modules/temperature-T61.ini ~/.config/polybar/midnight/modules/temperature.ini

# no experimental backends (and blur) for T61
sudo mv /usr/share/regolith-compositor/init-T61 /usr/share/regolith-compositor/init
