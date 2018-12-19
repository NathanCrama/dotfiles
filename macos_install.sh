#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget curl vim gcc rust lua python3 
brew install macvim --with-override-system-vim

echo "Deleting ~/.bashrc"
rm ~/.bashrc
echo "Deleting ~/.bash_profile"
rm ~/.bash_profile
echo "Deleting ~/.vimrc"
rm ~/.vimrc

ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vimrc ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 

vim +PluginInstall +qall
python3 ~/.vim/bundle/YouCompleteMe/install.py | grep 0

