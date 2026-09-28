#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

# ------------------------------ zen

# aliases
alias cx='codex --yolo'

# inits
eval "$(starship init bash)"

# must be last
eval "$(zoxide init bash --cmd cd)"

# >>> Codex installer >>>
export PATH="/home/p4rim/.local/bin:$PATH"
# <<< Codex installer <<<
