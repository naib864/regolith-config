#!/usr/bin/bash

# some programs
for i in discord steam; do
  sudo pacman -S $i --noconfirm
done

# replace module definitions
sudo mv ~/.config/polybar/midnight/modules/network-pc.ini ~/.config/polybar/midnight/modules/network.ini
sudo mv ~/.config/polybar/midnight/modules/temperature-pc.ini ~/.config/polybar/midnight/modules/temperature.ini

# replace bar definitions
sudo mv ~/.config/polybar/midnight/bars/bar-bottom-pc.ini ~/.config/polybar/midnight/bars/bar-bottom.ini
sudo mv ~/.config/polybar/midnight/bars/bar-top-pc.ini ~/.config/polybar/midnight/bars/bar-top.ini
