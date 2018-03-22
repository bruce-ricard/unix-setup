#!/bin/sh

current_directory=$(dirname `readlink -e $0`)

git clone https://github.com/olivierverdier/zsh-git-prompt.git ~/.zshd/zsh-git-prompt

ln -s -i $current_directory/emacs ~/.emacs
ln -s -i $current_directory/zshrc ~/.zshrc
ln -s -i $current_directory/screenrc ~/.screenrc
ln -s -i $current_directory/gitconfig ~/.gitconfig
