#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
if [[ -r "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# ------------------------------ zen

# enable vi mode 
# set -o vi

# starship

eval "$(starship init bash)"

# must be last
eval "$(zoxide init bash --cmd cd)"
