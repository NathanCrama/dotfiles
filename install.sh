#!/bin/bash

rm -v .bashrc
rm -v .vimrc
rm -v .bash_profile

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vimrc ~/.vimrc

vim +PluginInstall +qall
source .bashrc

