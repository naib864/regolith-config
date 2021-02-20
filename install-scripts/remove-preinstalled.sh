#!/usr/bin/bash

for i in arc-gtk-theme arc-icon-theme arcolinux-config-i3wm-git arcolinux-conky-collection-git arcolinux-kvantum-theme-arc-git arcolinux-kvantum-git arcolinux-hblock-git arcolinux-local-xfce4-git xfce4-settings thunar-archive-plugin thunar-media-tags-plugin xfce4-panel xfce4-appfinder xfce4-notifyd xfce4-power-manager xfce4-screenshooter xfce4-taskmanager xfce4-terminal thunar thunar-volman arcolinux-logout-themes-git arcolinux-logout-git arcolinux-nitrogen-git arcolinux-pipemenus-git arcolinux-termite-themes-git arcolinux-variety-git arcolinux-welcome-app-git arcolinux-xfce-git arcolinux-zsh-git avahi conky-lua-archers flatpak pamac-all kvantum-qt5 termite termite-terminfo vim zsh zsh-completions oh-my-zsh-git zsh-syntax-highlighting; do
  sudo pacman -Rs $i --noconfirm
done
