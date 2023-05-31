#
# ~/.bashrc
#

source /usr/share/fzf/completion.bash

HISTSIZE=2000
HISTFILESIZE=3000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi='nvim .'
alias nn='nvim'
alias flameshot='flameshot gui'

# alias ls='ls --color=auto'
#alias ll='exa -l --header --icons'

# rust btw
alias ls='exa'
alias cat='bat'
alias ps='procs'

# firefox dev
alias firefox='firefox-developer-edition'

exa() {
    if [[ "$#" -gt 0 ]]; then
        command exa --icons "$@"
    else
        command exa "$@"
    fi
}

#exa() {
#    if [[ "$1" == "-l" ]]; then
#        command exa --icons "$@"
#    elif [[ "$1" == "-a" ]]; then
#        command exa --icons "$@"
#    elif [[ "$1" == "-la" ]]; then
#        command exa --icons "$@"
#    else
#        command exa "$@"
#    fi 
#}

# number of positional arguments in bash
# ${#} or $#

# expands to current option flags
# $-


PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval "$(starship init bash)"

eval "$(zellij setup --generate-auto-start bash)"
