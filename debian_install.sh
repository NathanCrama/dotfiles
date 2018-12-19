#!/bin/bash

sudo apt update && sudo apt upgrade
sudo apt install build-essential git vim tree wget curl openssh-server openssh-client 

curl -L https://raw.githubusercontent.com/NathanCrama/dotfiles/master/script.sh | sh && ~/.vim/bundle/YouCompleteMe/install.sh | grep 0

echo "alias apt='sudo apt'" >> ~/.bashrc

