#!/bin/bash

cat ~/dotfiles/.brews | xargs brew install
cat ~/dotfiles/.casks | xargs brew cask install
