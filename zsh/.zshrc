. ~/.z_script/z.sh

alias bbs='cd ~/Web/Bbs'
alias todo='emacs ~/Web/Bbs/todo'
alias sites='cd ~/Web/Sites'
alias ..="cd .."
alias g='git'
alias got='git' # Fuck typos
alias gut='git' # Fuck typos again
alias flushdns='sudo dscacheutil -flushcache'
alias t='timetip'
alias timereport='cp ~/.timelogs ~/Documents/Dropbox/.timelogs-backup && node /Users/romainberger/Web/Bbs/bin/script-time.js'
alias b='boom'
alias bundle='nocorrect bundle'
alias phplog='tail -f /Applications/MAMP/logs/php_error.log'
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'
alias fuck='sudo $(fc -ln -1)'
alias stats='git log --shortstat --author="Romain Berger" | grep -E "fil(e|es) changed" | awk '"'"'{files+=$1; inserted+=$4; deleted+=$6} END {print "files changed: ", files, "lines inserted: ", inserted, "lines deleted: ", deleted }'"'"
