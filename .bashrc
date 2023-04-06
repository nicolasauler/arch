#
# ~/.bashrc
#

source /usr/share/fzf/completion.bash

HISTSIZE=2000
HISTFILESIZE=3000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval "$(starship init bash)"
