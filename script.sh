#!/bin/bash

echo "Deleting ~/.bash_profile"
rm ~/.bash_profile
echo "Deleting ~/.vimrc"
rm ~/.vimrc
echo "Deleting ~/.vim/"
rm -rf ~/.vim
echo "Deleting ~/dotfiles/"
rm -rf ~/dotfiles

git clone https://github.com/NathanCrama/dotfiles.git ~/dotfiles

ln -s ~/dotfiles/.vim ~/.vim
cat ~/dotfiles/.bashrc > ~/.bashrc
cat ~/dotfiles/.bash_profile > ~/.bash_profile
cat ~/dotfiles/.vimrc > ~/.vimrc
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 
source ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
