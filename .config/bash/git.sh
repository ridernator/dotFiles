if test -e ~/.git-completion.bash; then
  . ~/.git-completion.bash
fi

alias g=git
__git_complete g __git_main
