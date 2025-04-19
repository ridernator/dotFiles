declare -r SESH_WORK_DIR="/share"

sesh() {
  if test -z "$1"; then
    echo "sesh needs an argument"

    return 1
  fi

  if test "$1" = "-l"; then
    tmux list-sessions 2> /dev/null | cut --delimiter=: --fields=1

    return 0
  fi

  local -r directory="${SESH_WORK_DIR}/${1}"

  if test -d "$directory"; then
    sessionName="$(basename "$directory")"

    # # Create global window if not already up
    # if ! tmux has-session -t global &> /dev/null; then
    #   tmux new-session -d -c ~ -s global
    #   tmux rename-window -t global global
    # fi

    if ! tmux has-session -t "$sessionName" &> /dev/null; then
      tmux new-session -d -c "$directory" -s "$sessionName"
      tmux send-keys -t "$sessionName" nvim '+FzfLua git_files'C-m
      tmux rename-window -t "$sessionName" "editor"
      tmux new-window -c "$directory" -t "$sessionName" -n "terminal"
      # tmux link-window -s global:global -t "$sessionName"
      # tmux previous-window -t "$sessionName"
    fi

    if test -n "$TMUX"; then
      tmux switch-client -t "$sessionName"
    else
      tmux attach-session -d -t "$sessionName"
    fi
  else
    echo "No such directory \"$directory\""

    return 2
  fi
}

# _sesh_completion() {
#   if test ${#COMP_WORDS[@]} -ne 2; then
#     return
#   fi
#
#   local -a allWords=("-l");
#   for directory in ${SESH_WORK_DIR}/*; do
#     if test -d "$directory"; then
#       allWords+=("$(basename "$directory")")
#     fi
#   done
#
#   COMPREPLY=($(compgen -W "$(echo ${allWords[@]})" -- "${COMP_WORDS[1]}"))
# }

alias s="sesh \$(sesh -l | fzf)"
alias sn="sesh \$(find \"${SESH_WORK_DIR}\" -mindepth 1 -maxdepth 1 -type d -print0 | xargs --max-args=1 --null basename | fzf)"

bind '"\C-\ ": "\C-as\C-j"'
bind '"\C-\ \C-\ ": "\C-asn\C-j"'
