#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll="ls -lh"
alias vi=nvim
alias vim=nvim
alias g=git

if test "$TERM" = "xterm-kitty"; then
    alias ssh="kitty +kitten ssh"
fi

PS1='[\u@\h \W]\$ '
