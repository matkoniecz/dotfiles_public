#to enable it just add (without leading #)
#. /home/mateusz/Documents/install_moje/config_bash/my_addditions_to_bashrc.sh
#to ~/.bashrc

# http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion
source /usr/share/bash-completion/completions/git

# http://askubuntu.com/questions/62095/how-to-alias-git-to-g-so-that-bash-completion-rules-are-preserved
complete -o default -o nospace -F _git g

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

# sometimes /usr/local/bin/ is missing for some ridiculous reason
export PATH="/usr/local/bin/:$PATH"

export PYTHONPATH="/home/mateusz/Documents/install_moje/python_packages:$PYTHONPATH"