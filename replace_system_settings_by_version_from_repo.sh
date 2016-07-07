DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #from http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
cd $DIR
cp .gitconfig ~/.gitconfig
cp .gitignore_global ~/.gitignore_global
