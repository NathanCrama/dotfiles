#!/bin/bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget curl vim gcc rust lua python3 
brew install macvim --with-override-system-vim

curl -L https://raw.githubusercontent.com/NathanCrama/dotfiles/master/script.sh | sh && ~/.vim/bundle/YouCompleteMe/install.sh | grep 0

