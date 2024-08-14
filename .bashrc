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
alias cat="bat --paging=never"

# Git stuff
if test -e ~/.git-completion.bash; then
    . ~/.git-completion.bash
fi

alias g=git
__git_complete g __git_main

tstart() {
    if test -d "/share/${1}"; then
        tmux new-session -c "/share/${1}" -s "${1}"
    else
        echo "No such directory \"/share/${1}\""
    fi
}

# PS1
PS1='[\u@\h \W]\$ '
