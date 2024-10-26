# If not running interactively, don't do anything
[[ $- != *i* ]] && return

xrdb ~/.Xdefaults

source ~/.config/bash/bashrc
