#!/bin/sh

current_directory=$(dirname `readlink -e $0`)

ln -s -i $current_directory/emacs ~/.emacs
ln -s -i $current_directory/zshrc ~/.zshrc
ln -s -i $current_directory/screenrc ~/.screenrc
