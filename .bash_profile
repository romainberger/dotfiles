alias ..="cd .."
alias g='git'
alias flushdns='sudo dscacheutil -flushcache'
alias fuck='sudo $(fc -ln -1)'
alias perm='stat -c "%a %n"'
alias y=yarn
alias k=kcals

function _vol() {
    if [ $# -eq 0 ]; then
        osascript -e 'output volume of (get volume settings)'
    else
        osascript -e "set volume output volume $1"
    fi
}

alias vol=_vol

git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "🔥"}'
}

export PS1='🍕  \[\e[1;36m\]\W\[\e[0:33m\]\[ \e[1;31m`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`$(git_dirty_flag)\[\e[0m\]  '

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  __git_complete g __git_main
fi

if [ -f ~/kcals-completion.bash ]; then
    . ~/kcals-completion.bash
    __kcals_complete k
fi
