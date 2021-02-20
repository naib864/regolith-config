#!/usr/bin/bash

# replace module definitions
mv ~/config/polybar/midnight/modules/network-T61.ini ~/config/polybar/midnight/modules/network.ini
mv ~/config/polybar/midnight/modules/temperature-T61.ini ~/config/polybar/midnight/modules/temperature.ini

# replace bar definitions
mv ~/config/polybar/midnight/bars/bar-bottom-T61.ini ~/config/polybar/midnight/bars/bar-bottom.ini
mv ~/config/polybar/midnight/bars/bar-top-T61.ini ~/config/polybar/midnight/bars/bar-top.ini

# no experimental backends (and blur) for T61
sudo mv /usr/share/regolith-compositor/init-T61 /usr/share/regolith-compositor/init
