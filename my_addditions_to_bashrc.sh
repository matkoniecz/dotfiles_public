#to enable it just add (without leading #)
#. /home/mateusz/Documents/install_moje/config_bash/my_addditions_to_bashrc.sh
#to ~/.bashrc


alias search='find | grep -i'

# http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion
source /usr/share/bash-completion/completions/git


# was
## http://askubuntu.com/questions/62095/how-to-alias-git-to-g-so-that-bash-completion-rules-are-preserved
# complete -o default -o nospace -F _git g
# switched to https://askubuntu.com/a/642778
__git_complete g __git_main

# shortcuts for rubocop
alias ru='rubocop -DES'
alias rua='rubocop -DESa'
alias rur='rubocop -DESR'
alias rura='rubocop -DESR'

# http://superuser.com/a/195467/376651
# On the command line, cp and mv will overwrite any existing target file, 
# but you can make them prompt. I recommend these two aliases because 
# without them, cp and mv do two jobs: copying/moving and deleting. 
# Not having cp and mv delete files is more in keeping with the unix philosophy 
# (one command does one job) and less error-prone. 
# This is completely different from rm -i, which asks for confirmation before 
# doing its job — such a systematic prompt tends to trigger an automatic 
# response and thus becomes a useless annoyance.
alias cp='cp -i'
alias mv='mv -i'

#source ~/.rvm/scripts/rvm #to get rvm functions - solution from http://stackoverflow.com/a/19954186/4130619

# user install mode in pip puts binaries there
export PATH="/home/mateusz/.local/bin/:$PATH"

# make telegram command available
export PATH="/opt/telegram/:$PATH"

# sometimes /usr/local/bin/ is missing for some ridiculous reason
export PATH="/usr/local/bin/:$PATH"

# add my local packages
export PYTHONPATH="/home/mateusz/Documents/install_moje/python_packages:$PYTHONPATH"

# go specific path setups
export GOPATH="/home/mateusz/Documents/install/gopath_target"
export PATH="/home/mateusz/Documents/install/gopath_target/bin:$PATH"
export PATH="/usr/lib/go-1.10/bin:$PATH" #needed by backports by gophers - https://github.com/golang/go/wiki/Ubuntu

# download aliases

alias d-page='wget -E  -k -p'
alias d-youtube='youtube-dl -f mp4'
alias d-music-from-youtube='youtube-dl --extract-audio --audio-format mp3'

# for python 3.9 from deadsnakes
export PATH="/home/mateusz/.local/lib/python3.9/site-packages:$PATH"
export PATH="/home/mateusz/.local/lib/python3.9:$PATH"

export PATH="/home/mateusz/.local/lib:$PATH"
alias p='python3'
alias pip='pip3' # pip2 is available


export TDESKTOP_DISABLE_TRAY_COUNTER="GO_AWAY_STUPID_COUNTER"

# https://github.com/jakub-g/git-resolve-conflict
git-resolve-conflict() {
  STRATEGY="$1"
  FILE_PATH="$2"

  if [ "$1" = "--version" ]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cat $DIR/../package.json | grep version | sed 's/,//'
    return
  fi

  if [ -z "$FILE_PATH" ] || [ -z "$STRATEGY" ]; then
    echo "Usage:   git-resolve-conflict <strategy> <file>"
    echo ""
    echo "Example: git-resolve-conflict --ours package.json"
    echo "Example: git-resolve-conflict --union package.json"
    echo "Example: git-resolve-conflict --theirs package.json"
    return
  fi

  if [ ! -f "$FILE_PATH" ]; then
    echo "$FILE_PATH does not exist; aborting."
    return
  fi

  # remove leading ./ if present, to match the output of git diff --name-only
  # (otherwise if user input is './filename.txt' we would not match 'filename.txt')
  FILE_PATH_FOR_GREP=${FILE_PATH#./}
  # grep -Fxq: match string (F), exact (x), quiet (exit with code 0/1) (q)
  if ! git diff --name-only --diff-filter=U | grep -Fxq "$FILE_PATH_FOR_GREP"; then
    echo "$FILE_PATH is not in conflicted state; aborting."
    return
  fi

  git show :1:"$FILE_PATH" > ./tmp.common
  git show :2:"$FILE_PATH" > ./tmp.ours
  git show :3:"$FILE_PATH" > ./tmp.theirs

  git merge-file "$STRATEGY" -p ./tmp.ours ./tmp.common ./tmp.theirs > "$FILE_PATH"
  git add "$FILE_PATH"

  rm ./tmp.common
  rm ./tmp.ours
  rm ./tmp.theirs
}

# https://stackoverflow.com/a/179231/4130619
# probably will NOT work if there are any newlines at the end of the directory name
pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
if ([ -h "${SCRIPT_PATH}" ]) then
  while([ -h "${SCRIPT_PATH}" ]) do cd `dirname "$SCRIPT_PATH"`; SCRIPT_PATH=`readlink "${SCRIPT_PATH}"`; done
fi
cd `dirname ${SCRIPT_PATH}` > /dev/null
SCRIPT_PATH=`pwd`;
popd  > /dev/null

export RIPGREP_CONFIG_PATH="$SCRIPT_PATH/rip_grep.conf"