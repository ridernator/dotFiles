#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xrdb ~/.Xdefaults

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -l --human-readable"
alias vi=nvim
alias vim=nvim
alias tree="tree -C"

if command -v bat &> /dev/null; then
  alias cat="bat --paging=never"
fi

# Git stuff
if test -e ~/.git-completion.bash; then
  . ~/.git-completion.bash
fi

alias g=git
__git_complete g __git_main

sesh() {
  if test -d "$1"; then
    sessionName="$(basename "$1")"

    if ! tmux has-session -t "$sessionName"; then
      cd "$1"

      tmux new-session -d -c "$1" -s "$sessionName"
      tmux send-keys -t "$sessionName" nvim C-m
      tmux new-window -c "$1" -t "$sessionName"
      tmux previous-window -t "$sessionName"
    fi

    tmux attach-session -t "$sessionName"
  else
    echo "No such directory \"$1\""
  fi
}

complete -A directory sesh

# PS1
PS1='[\u@\h \W]\$ '
