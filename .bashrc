# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xrdb ~/.Xdefaults

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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

markup() {
  pandoc "$1" --from=gfm > /tmp/markup.html && firefox /tmp/markup.html &
}

sesh() {
  local -r directory="${1:-.}"

  if test -d "$directory"; then
    pushd "$directory" > /dev/null
      sessionName="$(basename "$(git rev-parse --show-toplevel)" | tr .: _)"
    popd > /dev/null

    if ! tmux has-session -t "$sessionName" &> /dev/null; then
      tmux new-session -d -c "$directory" -s "$sessionName"
      tmux send-keys -t "$sessionName" nvim C-m
      tmux new-window -c "$directory" -t "$sessionName"
      tmux previous-window -t "$sessionName"
    fi

    tmux attach-session -t "$sessionName"
  else
    echo "No such directory \"$directory\""
  fi
}

complete -A directory sesh

newScript() {
  local -r scriptName="$1"

  if test ! -e "$scriptName"; then
    echo "#!/usr/bin/env bash"        >> "$scriptName"
    echo                              >> "$scriptName"
    echo "cd \"\$(dirname \"\$0\")\"" >> "$scriptName"
    echo                              >> "$scriptName"
    echo "main() {"                   >> "$scriptName"
    echo "  :"                        >> "$scriptName"
    echo "}"                          >> "$scriptName"
    echo                              >> "$scriptName"
    echo "main \"\$@\""               >> "$scriptName"

    chmod +x "$scriptName"
  else
    echo "$scriptName already exists"
  fi
}

# PS1
PS1="[\[\e[32;40m\]\w\[\e[m\]] "
