# Load personal Bash settings for interactive login shells (TTY and tmux).
if [[ $- == *i* && -r "$HOME/.bashrc" ]]; then
    . "$HOME/.bashrc"
fi
