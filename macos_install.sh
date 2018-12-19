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
echo "Deleting ~/.vim/"
rm -rf ~/.vim
echo "Deleting ~/dotfiles/"
rm -rf ~/dotfiles

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile ~/.bash_profile
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/darcula.vim ~/.vim/colors/darcula.vim 
source ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sh ~/.vim/bundle/YouCompleteMe/install.sh | grep 0

