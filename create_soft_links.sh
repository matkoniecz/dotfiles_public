DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
rm ~/.bashrc
ln -s $DIR/.bashrc ~/.bashrc
