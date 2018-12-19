#!/bin/bash

sudo pacman-mirrors --fasttrack && sudo pacman -Syyu --noconfirm
sudo pacman -Syu --noconfirm
sudo pacman --noconfirm base-devel git vim tree wget curl openssh network-manager wpa_supplicant wireless_tools yajl

echo "Deleting ~/.vim/"
rm -rf ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 

echo "Deleting ~/.vimrc"
rm -v ~/.vimrc
ln -s ~/dotfiles/.vimrc ~/.vimrc

vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py

cat ~/dotfiles/.bashrc >> ~/.bashrc
cat ~/dotfiles/.bash_profile >> ~/.bash_profile

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

rm -dvfR ~/yaourt ~/package-query