#!/usr/bin/bash
# this script was used to remove some arcolinux-i3 preinstalled stuff I didn't use.
# Since I switched to Arch, it isn't needed anymore.
# order is important to satisfy dependencies
for i in arcolinux-i3wm-git arc-gtk-theme arc-icon-theme arcolinux-config-i3wm-git arcolinux-conky-collection-git arcolinux-kvantum-theme-arc-git arcolinux-kvantum-git arcolinux-hblock-git arcolinux-local-xfce4-git xfce4-settings thunar-archive-plugin thunar-media-tags-plugin xfce4-appfinder xfce4-power-manager xfce4-notifyd xfce4-screenshooter xfce4-panel xfce4-taskmanager xfce4-terminal thunar-volman thunar arcolinux-logout-themes-git arcolinux-logout-git arcolinux-betterlockscreen-git arcolinux-nitrogen-git arcolinux-pipemenus-git arcolinux-termite-themes-git arcolinux-variety-git arcolinux-welcome-app-git arcolinux-xfce-git arcolinux-zsh-git conky-lua-archers flatpak pamac-all kvantum-qt5 ristretto regolith-st urxvt-perls urxvt-resize-font-git rxvt-unicode termite termite-terminfo variety vim zsh-completions oh-my-zsh-git zsh-syntax-highlighting zsh; do
  sudo pacman -Rs $i --noconfirm
done
