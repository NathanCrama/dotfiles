#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman --noconfirm base-devel git vim tree wget curl openssh network-manager wpa_supplicant wireless_tools yajl

curl -L https://raw.githubusercontent.com/NathanCrama/dotfiles/master/script.sh | sh && ~/.vim/bundle/YouCompleteMe/install.sh | grep 0

echo "alias pacman='sudo pacman'" >> ~/.bashrc
echo "alias pm='sudo pacman -Sy --noconfirm'" >> ~/.bashrc

git clone https://aur.archlinux.org/package-query.git ~/package-query
cd ~/package-query 
"y" | makepkg -si
cd ~

git clone https://aur.archlinux.org/yaourt.git ~/yaourt
cd ~/yaourt
"y" | makepkg -si
cd ~

rm -dvR ~/yaourt ~/package-query


