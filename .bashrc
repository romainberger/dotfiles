alias ..="cd .."
alias g='git'
alias got='git' # Fuck typos
alias gut='git' # Fuck typos again
alias gti='git' # Fuck typos for real
alias gi='git'  # Fuck
alias gt='git'  # Crap
alias it='git'  # Or just learn how to fucking type
alias flushdns='sudo dscacheutil -flushcache'
alias fuck='sudo $(fc -ln -1)'
alias perm='stat -c "%a %n"'
alias y=yarn
alias k=kcals

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "🔥"}'
}

export PS1='🍕  \[\e[1;36m\]\W\[\e[0:33m\]\[ \e[1;31m`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`$(git_dirty_flag)\[\e[0m\]  '

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
