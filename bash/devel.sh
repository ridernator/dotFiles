alias gdb="gdb -ex=\"set confirm off\""

dev() {
  if ! tmux has-session -t home &> /dev/null; then
    tmux new-session -d -c "${HOME}" -s home
  fi

  if test -n "$TMUX"; then
    tmux switch-client -t home
  else
    while tmux attach-session -d -t home 2> /dev/null; do
      :
    done

    local -r sessionCount="$(tmux list-sessions 2> /dev/null | wc --lines)"

    if test $sessionCount -gt 0; then
      echo "$sessionCount sessions left alive"
    fi
  fi
}
