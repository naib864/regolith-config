#!/usr/bin/bash

# full system update
sudo pacman -Syu --noconfirm

# install yay
cd ~/temp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
sudo pacman -Rs go
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
for i in picom nano pacman-contrib gnome-disk-utility xdg-user-dirs neofetch noto-fonts-cjk noto-fonts-extra noto-fonts-emoji ttf-ubuntu-font-family file-roller gnome-terminal vlc ncdu xorg-xrdb firefox mousepad eog bpytop atom fish kdeconnect gucharmap qt5-tools gdm grub-theme-vimix; do
  sudo pacman -S $i --noconfirm
done

yay -S ttf-material-design-icons-webfont

# enable gdm + theme
sudo systemctl enable gdm.service

cd ~/temp/regolith-config/gdm-theme/theme
glib-compile-resources gnome-shell-theme.gresource.xml
sudo cp gnome-shell-theme.gresource /usr/share/gnome-shell

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

# grub theme
sudo cp ~/Pictures/itanium/background.jpeg /usr/share/grub/themes/Vimix
echo "GRUB_THEME=\"/usr/share/grub/themes/Vimix/theme.txt\"" | sudo tee -a /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# lock screen setup
betterlockscreen -u ~/Pictures/itanium/background.jpg
sudo systemctl enable betterlockscreen@naib864.service
gsettings set org.gnome.gnome-flashback screensaver false

# spotify polybar
yay -S polybar-spotify-module
systemctl --user enable spotify-listener

# apply regolith-look
regolith-look set midnight
