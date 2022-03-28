alias g='git'

# main list below can be regenerated with
# g aliases | sed "s/ .*//" | sed "s/alias\.//" | grep . | egrep -v "^(ps|tree|ls)$" | sort | sed "s/\(.*\)/alias \1='git \1'/"
# g aliases
#     list of aliases
#
# sed "s/ .*//"
#     drops info of alias target
#
# sed "s/alias\.//"
#     removes alias. prefix
#
# grep .
#     drops empty lines (possible with very long aliased commands displayed in multiple lines)
#
# sort
#     to keep list order stable
#
# egrep -v "^(ps|tree|ls)$"
#     drops unaliased exceptions
#
#     now only wanted aliases remain
# sed "s/\(.*\)/alias \1='git \1'/"
#     expand to wanted format

# not aliased, not covered by generation
alias tag='git tag'
alias clone='git clone'
alias remote='git remote'
alias reflog='git reflog'
alias merge='git merge'

# not aliased by rather a separate commands - not covered
alias nuke='git nuke'

# exception, removed from generating kept here for documentation and reminder
#alias ls='git ls'
#alias tree='git tree'
#alias ps='git ps' conflicts with system ps

#generated aliases
alias def='git def'
alias defence='git defence'
alias defe='git defe'
alias defen='git defen'
alias defend='git defend'
alias edit='git edit'
alias edits='git edits'
alias edited='git edited'
alias a='git a'
alias aa='git aa'
alias aaa='git aaa'
alias ai='git ai'
alias aliases='git aliases'
alias ap='git ap'
alias b='git b'
alias ba='git ba'
alias bd='git bd'
alias bl='git bl'
alias bl='git lm'
alias merged='git merged'
alias bl2='git bl2'
alias br='git br'
alias c='git c'
alias ca='git ca'
alias caa='git caa'
alias clone='git clone'
alias clone-base='git clone-base'
alias co='git co'
alias conflict='git conflict'
alias conflicts='git conflicts'
#alias cp='git cp' conflicts with copy command
alias d='git d'
alias dc='git dc'
alias dcw='git dcw'
alias dl='git dl'
alias dlc='git dlc'
alias dm='git dm'
alias dp='git dp'
alias dw='git dw'
alias f='git f'
alias i='git i'
alias import='git import'
alias l='git l'
alias lf='git lf'
alias lg='git lg'
alias ll='git ll'
alias lstd='git lstd'
alias m='git m'
alias ma='git ma'
alias mum='git mum'
alias o='git o'
alias ob='git ob'
alias om='git om'
alias oops='git oops'
alias ops='git ops'
alias orphan='git orphan'
alias pl='git pl'
alias plu='git plu'
alias psf='git psf'
alias pso='git pso'
alias psu='git psu'
alias r='git r'
alias ra='git ra'
alias rao='git rao'
alias rb='git rb'
alias rba='git rba'
alias rbc='git rbc'
alias rbi='git rbi'
alias rbs='git rbs'
alias re='git re'
alias reh='git reh'
alias rp='git rp'
alias rl='git rl'
alias remotes='git remotes'
alias rpo='git rpo'
alias rr='git rr'
alias rs='git rs'
alias ru='git ru'
alias rua='git rua'
alias rur='git rur'
alias rura='git rura'
alias ruta='git ruta'
alias rut='git rut'
alias rv='git rv'
alias s='git s'
alias sf='git sf'
alias so='git so'
alias t='git t'
alias war='git war'
