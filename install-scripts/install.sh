#!/usr/bin/bash

# full system update
sudo pacman -Syu --noconfirm

# install yay
cd ~/temp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~/temp

# install regolith
cd ~/temp
git clone https://github.com/gardotd426/regolith-de
cd regolith-de
makepkg -si
cd ~/temp

# reinstall modified version of rofication manually to work with polybar
git clone https://github.com/naib864/regolith-rofication
cd regolith-rofication
sudo rm /usr/bin/rofication-*
sudo python3 setup.py install
cd ~/temp

# install some applications (replace these with your own stuff)
for i in picom gnome-terminal vlc ncdu xorg-xrdb firefox mousepad eog bpytop atom fish kdeconnect gucharmap qt5-tools qt5-quickcontrols qt5-graphicaleffects sddm; do
  sudo pacman -S $i --noconfirm
done

yay -S ttf-material-design-icons-webfont

# disable lightdm and set systemd sddm service (regolith ships with lightdm, so that will be removed)
sudo systemctl disable lightdm.service
sudo systemctl enable sddm.service
sudo pacman -Rs lightdm

# Remove unused applications (change that to your choices) and reinstall betterlockscreen as it will be removed by a dependency in the process
# sudo ~/temp/regolith-config/install-scripts/remove-preinstalled.sh
yay -S betterlockscreen

# copy configs etc.
cd ~/temp/regolith-config
cp -r ~/temp/regolith-config/Pictures/ ~/
cp -r ~/temp/regolith-config/.config ~/
cp -r ~/temp/regolith-config/.local ~/
chmod +x ~/.config/polybar/midnight/*.sh
chmod +x ~/.config/polybar/midnight/scripts/*.sh
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
