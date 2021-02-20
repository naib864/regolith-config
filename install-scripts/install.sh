#!/usr/bin/bash

# full system update
sudo pacman -Syu --noconfirm

# install regolith
cd ~/temp
git clone https://github.com/gardotd426/regolith-de
cd regolith-de
makepkg -si
cd ~/temp

# install rofication for polybar
git clone https://github.com/naib864/regolith-rofication
cd regolith-rofication
sudo python3 setup.py install
cd ~/temp

# install some applications (replace these with your own stuff)
for i in gnome-terminal vlc ncdu mousepad eog bpytop atom fish kdeconnect gucharmap qt5-tools sddm; do
  sudo pacman -S $i --noconfirm
done

yay -S ttf-material-design-icons-webfont

# disable lightdm and set systemd sddm service
sudo systemctl disable lightdm.service
sudo systemctl enable sddm.service
sudo pacman -Rs arcolinux-lightdm-gtk-greeter arcolinux-lightdm-gtk-greeter-settings lightdm

# Remove unused applications (change that to your choices) and reinstall betterlockscreen as it will be removed by a dependency in the process
sudo ~/temp/regolith-config/install-scripts/remove-preinstalled.sh
sudo pacman -S betterlockscreen

# copy configs etc.
cd ~/temp/regolith-config
cp -r ~/temp/regolith-config/Pictures/ ~/
sudo cp -r ~/temp/regolith-config/.config ~/
sudo cp -r ~/temp/regolith-config/.local ~/
sudo chmod +x ~/.config/polybar/midnight/*.sh
sudo chmod +x ~/.config/polybar/midnight/scripts/*.sh
sudo cp -r ~/temp/regolith-config/etc /
sudo cp -r ~/temp/regolith-config/usr /
cd ~/temp

# lock screen setup
betterlockscreen -u ~/Pictures/itanium/background.jpg
sudo systemctl enable betterlockscreen@naib864.service
gsettings set org.gnome.gnome-flashback screensaver false

# spotify polybar
yay -S polybar-spotify-module
systemctl --user enable spotify-listener

# apply regolith-look
regolith-look set midnight
