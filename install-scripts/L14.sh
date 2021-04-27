#!/usr/bin/bash

# some programs
for i in libreoffice discord steam tlp acpi_call; do
  sudo pacman -S $i --noconfirm
done

yay -S tlpui

#enable tlp
sudo systemctl enable tlp
sudo systemctl start tlp

# replace module definitions
sudo mv ~/.config/polybar/midnight/modules/backlight-L14.ini ~/.config/polybar/midnight/modules/backlight.ini
sudo mv ~/.config/polybar/midnight/modules/temperature-L14.ini ~/.config/polybar/midnight/modules/temperature.ini
