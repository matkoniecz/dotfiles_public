#to enable it just add (without leading #)
#. /home/mateusz/Documents/install_moje/config_bash/my_addditions_to_bashrc.sh
#to ~/.bashrc

alias apt=apt-get # hides part of ads
# yes, "sudo apt-get dist-upgrade" shows an ad for Canonical products
# https://bugs.launchpad.net/ubuntu/+source/ubuntu-advantage-tools/+bug/1992026


alias pinta='flatpak run com.github.PintaProject.Pinta'

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

# go specific path setups
export GOPATH="/home/mateusz/Documents/install/gopath_target"
export PATH="/home/mateusz/Documents/install/gopath_target/bin:$PATH"
export PATH="/usr/lib/go-1.10/bin:$PATH" #needed by backports by gophers - https://github.com/golang/go/wiki/Ubuntu

# ~/Documents/install goes straight to PATH
export PATH="/home/mateusz/Documents/install:$PATH"

# download aliases

alias d-page='wget -E  -k -p'
alias d-youtube='yt-dlp --merge-output-format mp4'
alias d-music-from-youtube='yt-dlp --extract-audio --audio-format mp3'

# for python 3.9 from deadsnakes
export PATH="/home/mateusz/.local/lib/python3.9/site-packages:$PATH"
export PATH="/home/mateusz/.local/lib/python3.9:$PATH"

export PATH="/home/mateusz/.local/lib:$PATH"
alias p='python3'
alias pip='pip3' # pip2 is available


export TDESKTOP_DISABLE_TRAY_COUNTER="GO_AWAY_STUPID_COUNTER"

# https://stackoverflow.com/a/6840978/4130619
SCRIPT_PATH=`dirname "$(readlink -f "$BASH_SOURCE")"`

export RIPGREP_CONFIG_PATH="$SCRIPT_PATH/rip_grep.conf"

alias rgo='python3 ~/.config/ripgrep_open_files.py'
alias rgopen='python3 ~/.config/ripgrep_open_files.py'

# https://stackoverflow.com/questions/46288847/how-to-suppress-pip-upgrade-warning
# stop pip from pointless unwanted distracting spammy begging
export PIP_DISABLE_PIP_VERSION_CHECK=1

export PATH="/home/mateusz/Documents/install/yt-dlp_builds:$PATH"
