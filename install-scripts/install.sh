#!/usr/bin/bash

# full system update
sudo pacman -Syu --noconfirm

# install regolith
cd ..
git clone https://github.com/gardotd426/regolith-de && cd regolith-de
makepkg -si
cd ..

# copy configs etc.
cp -r Pictures/ ~/
cp -r regolith-config/.config ~/
cp -r regolith-config/.local ~/
chmod +x ~/.config/polybar/midnight/*.sh
chmod +x ~/.config/polybar/midnight/scripts/*.sh
sudo cp -r etc/ /
sudo cp -r usr/ /
cd ..

# install rofication for polybar
git clone https://github.com/naib864/regolith-rofication && cd regolith-rofication
sudo python3 setup.py install
cd ..

# install some applications
for i in gnome-terminal bpytop atom fish kdeconnect gucharmap qt5-tools sddm; do
  sudo pacman -S $i --noconfirm
done

yay -S ttf-material-design-icons-webfont

# set systemd sddm service
sudo systemctl disable lightdm.service
sudo systemctl enable sddm.service

sudo pacman -Rs arcolinux-lightdm-gtk-greeter
sudo pacman -Rs arcolinux-lightdm-gtk-greeter-settings
sudo pacman -Rs lightdm

# lock screen setup
betterlockscreen -u Pictures/itanium/background.jpg