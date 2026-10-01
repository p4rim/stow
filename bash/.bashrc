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

# aliases
alias cx='codex --yolo'

# inits
# eval "$(starship init bash)"

# enable vi mode 
# set -o vi

# must be last
eval "$(zoxide init bash --cmd cd)"


# >>> Codex installer >>>
export PATH="/home/p4rim/.local/bin:$PATH"
# <<< Codex installer <<<
