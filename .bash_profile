
git_dirty_flag() {
  git status 2> /dev/null | grep -c : | awk '{if ($1 > 0) print "⚡"}'
}

export PS1='\[\e[0:35m⌘\e[m \e[0:36m\]\w \[\e[0:33m\]`git branch 2> /dev/null | grep -e ^* | sed -E s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`$(git_dirty_flag) \[\e[0m\]'
