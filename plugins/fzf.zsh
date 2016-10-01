# Setup fzf
# ---------
if [[ ! "$PATH" == */home/romgrk/.local/fzf/bin* ]]; then
  export PATH="$PATH:/home/romgrk/.local/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/romgrk/.local/fzf/man* && -d "/home/romgrk/.local/fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/romgrk/.local/fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/romgrk/.local/fzf/shell/completion.zsh" 2> /dev/null


# FIXME for colors
[[ ! ( $TERM =~ '256' ) ]] && export TERM="xterm-256color"

