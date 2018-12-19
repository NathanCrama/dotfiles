#!/bin/bash

sudo pacman -Syu --noconfirm
sudo pacman --noconfirm base-devel git vim tree wget curl openssh network-manager wpa_supplicant wireless_tools yajl

echo "Deleting ~/.vimrc"
rm ~/.vimrc
echo "Deleting ~/.vim/"
rm -rf ~/.vim

ln -s ~/dotfiles/.vim ~/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cat ~/dotfiles/.bashrc > ~/.bashrc
cat ~/dotfiles/.bash_profile > ~/.bash_profile
cat ~/dotfiles/.vimrc > ~/.vimrc
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 
source ~/.bashrc

vim +PluginInstall +qall

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


