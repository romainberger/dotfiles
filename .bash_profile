
export PS1='\[\e[0:35m⌘\e[m \e[0:36m\]\w \[\e[0:33m\]`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /` \[\e[0m\]'
