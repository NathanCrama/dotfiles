#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y build-essential git vim tree wget curl openssh-server openssh-client 

echo "Deleting ~/.vimrc"
rm ~/.vimrc
echo "Deleting ~/.vim/"
rm -rf ~/.vim

ln -s ~/dotfiles/.vim ~/.vim
cat ~/dotfiles/.bashrc > ~/.bashrc
cat ~/dotfiles/.bash_profile > ~/.bash_profile
cat ~/dotfiles/.vimrc > ~/.vimrc
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 
source ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "alias apt='sudo apt'" >> ~/.bashrc

