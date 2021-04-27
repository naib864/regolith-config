#!/usr/bin/bash

# some programs
for i in libreoffice xournalpp discord steam tlp acpi_call tp_smapi onboard; do
  sudo pacman -S $i --noconfirm
done

#enable tlp
sudo systemctl enable tlp
sudo systemctl start tlp

# tablet mode and tlpui
yay -S detect-tablet-mode-git tlpui

# replace bar definitions
sudo mv ~/.config/polybar/midnight/bars/bar-bottom-X1.ini ~/.config/polybar/midnight/bars/bar-bottom.ini
