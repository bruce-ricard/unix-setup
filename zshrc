alias ls='ls -G --color'
alias ll='ls -l'
alias l='less'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'

alias sl=ls

alias ssh-add='ssh-add || { eval `ssh-agent` && ssh-add }'

export PATH="$PATH:~/bin:/Applications/Contents/Resources/bin/"
export EDITOR='emacs -nw'


# Git shit

source ~/.zshd/zsh-git-prompt/zshrc.sh
#source ~/.git-prompt.sh

function chpwd() { # to ls after directory change
    emulate -LR zsh
    ls
}

function echodo () {
       echo "$@"
       "$@"
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
#  elif [[ $USER = "root" ]]; then
#      me="%{bg[red]}ROOT"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  echo me:$me
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

PROMPT="${ret_status} ${_user_host}%{$reset_color%} %D{%a %m/%d %k:%M:%S} %{$fg_bold[green]%}> %{$reset_color%}"
RPROMPT="\$(git_super_status) %~" # prompt for right side of screen

# Configures PATH and OCAMLPATH for godi. Check that the paths
# match your local godi installation!
function godi () {
   if [ -z "$1" ]; then
       echo $PATH | sed 's/.*\/godi.\([0-9.]\+\)\/.*/\1/g'
   else
       shopt -s extglob
       case $PATH in
           */godi/*) echodo export PATH=${PATH//godi\/+([0-9.])/godi\/$1} ;;
           *) echodo export PATH=/opt/godi/$1/bin:$PATH ;;
       esac
   fi
   if [ -d .git ]; then
       export OCAMLPATH=$PWD:$PWD/lib:$PWD/ps-lib
       echo OCAMLPATH=$OCAMLPATH
   fi
}

# ssh autocomplete known_hosts
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 2 numeric
zstyle :compinstall filename '/home/bruce/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt autocd extendedglob
bindkey -e

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
setopt HUP

## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
LISTMAX=0

## disable mail checking
xMAILCHECK=0

autoload -U colors
colors

# End of lines configured by zsh-newuser-install

md() { mkdir $1 && cd $1 }
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' glob 1
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' match-original both
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/bruce/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Ocaml stuff

alias ocaml='ledit -x -h ~/.ocaml_history ocaml'
eval `opam config env`
eval `opam config env`

# OPAM configuration
. /Users/bruce.ricard/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
