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

# Git stuff
if test -e ~/.git-completion.bash; then
    . ~/.git-completion.bash
fi

alias g=git
__git_complete g __git_main

# PS1
PS1='[\u@\h \W]\$ '
