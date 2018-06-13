set -Eeuo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
[ -e ~/.bashrc ] && rm ~/.bashrc
ln -s $DIR/.bashrc ~/.bashrc

[ -e ~/.config/lxsession/Lubuntu/desktop.conf ] && rm ~/.config/lxsession/Lubuntu/desktop.conf
ln -s $DIR/desktop.conf ~/.config/lxsession/Lubuntu/desktop.conf

[ -e ~/.config/lxsession/Lubuntu/autostart ] && rm ~/.config/lxsession/Lubuntu/autostart
ln -s $DIR/autostart ~/.config/lxsession/Lubuntu/autostart
