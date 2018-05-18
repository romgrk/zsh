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


export FZF_DEFAULT_OPTS='--inline-info
--margin 0,0,0,2
--ansi
--select-1
--color dark
--color fg+:253,bg+:236,hl+:196,pointer:196
--color hl:164,info:202,prompt:196,header:190
--bind alt-j:down,alt-k:up,tab:up
--bind alt-u:page-up,alt-d:page-down
--bind ctrl-u:unix-line-discard,ctrl-d:page-down
--bind alt-s:toggle-sort
--bind alt-i:ignore
--bind ";:execute(less {})"
--bind "alt-v:execute(gloobus-preview {})"
--bind "alt-y:execute(echo {} | xclip -selection clipboard)"
'
