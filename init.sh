#! /usr/bin/env bash

cd

sudo apt install stow git


git clone git@github.com:TheNeuralBit/dotfiles.git

cd dotfiles
echo
echo "Which config groups would you like to use? (options: i3, vim, git, bash)"
read packages

echo
echo "Linking '$packages'"
stow $packages
