#!/usr/bin/env bash

set -e

echo ''

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

install_omz() {
  local overwrite skip backup

  info 'Installing oh-my-zsh'

  if [ -e "$HOME/.oh-my-zsh" ]
  then
    user ' $HOME/.oh-my-zsh already exists, what do you want to do? [o]verwrite, [b]ackup, [s]kip?'
    read -n 1 action < /dev/tty

    case "$action" in
      o )
        overwrite=true;;
      b )
        backup=true;;
      s )
        skip=true;;
      * )
        ;;
    esac

    if [[ "$overwrite" == "true" ]]
    then
      rm -rf $HOME/.oh-my-zsh
      success 'removed $HOME/.oh-my-zsh'
    fi

    if [[ "$backup" == "true" ]]
    then
      mv $HOME/.oh-my-zsh $HOME/.oh-my-zsh.backup
      success 'moved $HOME/.oh-my-zsh to $HOME/.oh-my-zsh.backup'
    fi
  fi

  if [[ "$skip" == "" ]]
  then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh > /dev/null
    success 'oh-my-zsh installed'
  fi
}

install_omz
