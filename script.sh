#!/bin/bash

echo "Deleting ~/.bashrc"
rm ~/.bashrc
echo "Deleting ~/.bash_profile"
rm ~/.bash_profile
echo "Deleting ~/.vimrc"
rm ~/.vimrc
echo "Deleting ~/.vim/"
rm -rf ~/.vimrc

git clone https://github.com/NathanCrama/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
source .bashrc
