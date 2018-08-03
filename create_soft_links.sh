#!/bin/bash
set -Eeuo pipefail
IFS=$'\n\t'
err_report() {
    echo "Error on line $1"
}
trap 'err_report $LINENO' ERR

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in

prepare_for_linking() {
  if [ -L "$1" ]; then
    rm "$1"
  fi
  if [ -e "$1" ]; then
    echo "file $1 exists and is not a symbolic link, was not removed to prevent accidental damage"
  fi
}

prepare_for_linking "$HOME/.bashrc"
prepare_for_linking "$HOME/.config/lxsession/Lubuntu/desktop.conf"
prepare_for_linking "$HOME/.gitignore_global"
prepare_for_linking "$HOME/.gitconfig"
prepare_for_linking "$HOME/.gitattributes"

ln -s "$DIR/.bashrc" "$HOME/.bashrc"
ln -s "$DIR/desktop.conf" "$HOME/.config/lxsession/Lubuntu/desktop.conf"
ln -s "$DIR/.gitignore_global" "$HOME/.gitignore_global"
ln -s "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DIR/.gitattributes" "$HOME/.gitattributes"
