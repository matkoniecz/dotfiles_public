#!/bin/bash
set -Eeuo pipefail
IFS=$'\n\t'
err_report() {
    echo "Error on line $1"
}
trap 'err_report $LINENO' ERR

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
if [ -e "$HOME/.bashrc" ]; then
  rm "$HOME/.bashrc"
fi
if [ -e "$HOME/.config/lxsession/Lubuntu/desktop.conf" ]; then
  rm "$HOME/.config/lxsession/Lubuntu/desktop.conf"
fi
if [ -e "$HOME/.config/lxsession/Lubuntu/autostart" ]; then
  rm "$HOME/.config/lxsession/Lubuntu/autostart"
fi

ln -s "$DIR/.bashrc" "$HOME/.bashrc"
ln -s "$DIR/desktop.conf" "$HOME/.config/lxsession/Lubuntu/desktop.conf"
ln -s "$DIR/autostart" "$HOME/.config/lxsession/Lubuntu/autostart"

if [ -e "$HOME/.gitignore_global" ]; then
  rm "$HOME/.gitignore_global"
  echo "$HOME/.gitignore_global"
fi
if [ -e "$HOME/.gitconfig" ]; then
  rm "$HOME/.gitconfig"
fi
if [ -e "$HOME/.gitattributes" ]; then
  rm "$HOME/.gitattributes"
fi

ln -s "$DIR/.gitignore_global" "$HOME/.gitignore_global"
ln -s "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -s "$DIR/.gitattributes" "$HOME/.gitattributes"
