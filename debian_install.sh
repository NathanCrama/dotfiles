#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y build-essential git vim tree wget curl openssh-server openssh-client 

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

echo "alias apt='sudo apt'" >> ~/.bashrc

echo " "
echo "###################################################"
echo " Installation finished! "
echo "###################################################"
