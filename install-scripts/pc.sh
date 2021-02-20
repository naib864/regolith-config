#!/usr/bin/bash

# replace module definitions
mv ~/.config/polybar/midnight/modules/network-pc.ini ~/.config/polybar/midnight/modules/network.ini
mv ~/.config/polybar/midnight/modules/temperature-pc.ini ~/.config/polybar/midnight/modules/temperature.ini

# replace bar definitions
mv ~/.config/polybar/midnight/bars/bar-bottom-pc.ini ~/.config/polybar/midnight/bars/bar-bottom.ini
mv ~/.config/polybar/midnight/bars/bar-top-pc.ini ~/.config/polybar/midnight/bars/bar-top.ini
