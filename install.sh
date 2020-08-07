#!/bin/bash

set -euo pipefail

if [[ `uname` == 'Linux' ]]; then
    readlink=readlink

    sudo apt-get install xclip -y
else
    readlink=greadlink
fi

current_directory=$(dirname `$readlink -e -- "$0"`)

GIT_PROMPT_DIR="${HOME}/.zshd/zsh-git-prompt"

if [ ! -d "$GIT_PROMPT_DIR" ]; then
    echo Installing git prompt
    mkdir -p "${GIT_PROMPT_DIR}"
    git clone https://github.com/starcraftman/zsh-git-prompt.git "$GIT_PROMPT_DIR"
fi

ln -s -i $current_directory/emacs ~/.emacs
ln -s -i $current_directory/zshrc ~/.zshrc
ln -s -i $current_directory/screenrc ~/.screenrc
ln -s -i $current_directory/gitconfig ~/.gitconfig
ln -s -i $current_directory/zprofile ~/.zprofile

echo 'You should now log out and log back in for your configuration to take effect'
