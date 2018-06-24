#!/bin/bash
set -Eeuo pipefail
IFS=$'\n\t'

err_report() {
    echo "Error on line $1"
}
trap 'err_report $LINENO' ERR

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in

if [ -f ~/.gitignore_global ]; then
  rm ~/.gitignore_global
fi
if [ -f ~/.gitconfig ]; then
  rm ~/.gitconfig
fi

ln -s $DIR/.gitignore_global ~/.gitignore_global
ln -s $DIR/.gitconfig ~/.gitconfig
