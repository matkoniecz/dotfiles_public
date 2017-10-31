DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
ln -s $DIR/.gitignore_global ~/.gitignore_global
ln -s $DIR/.gitconfig ~/.gitconfig
