#!/usr/bin/bash

# some programs
for i in libreoffice xournalpp discord steam tlp acpi_call tp_smapi onboard; do
  sudo pacman -S $i --noconfirm
done

#enable tlp
sudo systemctl enable tlp
sudo systemctl start tlp

# tablet mode
yay -S detect-tablet-mode-git
