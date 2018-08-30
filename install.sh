#!/bin/sh

set -e

current_directory=$(dirname `readlink -e $0`)

GIT_PROMPT_DIR='~/.zshd/zsh-git-prompt'

if [ ! -d "$GIT_PROMPT_DIR" ]; then
    git clone https://github.com/olivierverdier/zsh-git-prompt.git "$GIT_PROMPT_DIR"
fi

ln -s -i $current_directory/emacs ~/.emacs
ln -s -i $current_directory/zshrc ~/.zshrc
ln -s -i $current_directory/screenrc ~/.screenrc
ln -s -i $current_directory/gitconfig ~/.gitconfig
ln -s -i $current_directory/zprofile ~/.zprofile

echo 'You should now log out and log back in for your configuration to take effect'
