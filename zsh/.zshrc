. ~/.z_script/z.sh

alias ..="cd .."
alias g='git'
alias got='git' # Fuck typos
alias gut='git' # Fuck typos again
alias gti='git' # Fuck typos for real
alias gi='git'  # Fuck
alias gt='git'  # Crap
alias it='git'  # Or just learn how to fucking type
alias flushdns='sudo dscacheutil -flushcache'
alias bundle='nocorrect bundle'
alias fuck='sudo $(fc -ln -1)'
alias stats='git log --shortstat --author="Romain Berger" | grep -E "fil(e|es) changed" | awk '"'"'{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed:  ", files, "\nlines inserted: ", inserted, "\nlines deleted:  ", deleted }'"'"
alias perm='stat -c "%a %n"'

