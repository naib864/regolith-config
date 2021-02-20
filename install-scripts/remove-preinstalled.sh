#!/usr/bin/bash

for i in adwaita-icon-theme arc-gtk-theme arc-icon-theme arcolinux-config-i3wm-git arcolinux-conky-collection-git arcolinux-kvantum-theme-arc-git arcolinux-kvantum-git arcolinux-hblock-git arcolinux-local-xfce4-git; do
  sudo pacman -Rs $i --noconfirm
done
