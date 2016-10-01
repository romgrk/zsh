#!/bin/zsh

# Zsh/Zle widgets & more

# ls dir on each cd
function chpwd() {
    emulate -L zsh
    ls --group-directories-first
    # RPS1="`get_rprompt`"
}

# SECTION: zle widgets

function cd-parent-directory () {
    cd ..
    zle zle-line-init
}
function cd-previous () {
    pushd -1
    zle zle-line-init
    #zle reset-prompt
}
function cd-next () {
    pushd +1
    zle zle-line-init
    #zle reset-prompt
}
zle -N cd-parent-directory
zle -N cd-previous
zle -N cd-next

# SECTION: Vi-mode
function replace-mode {
    #zle -K viins
    zle overwrite-mode
    zle zle-keymap-select
}
zle -N replace-mode

# SECTION: Command-line widgets

function space-complete () {
    #LBUFFER=${LBUFFER/noglob[ ]/}
    RPS1="[$KEYMAP]"
    LBUFFER="$LBUFFER "
    zle list-choices
    #zle redisplay
}
zle -N space-complete


function yank-or-pop () {
    if [[ -n $ZLE_ACTIVE ]]; then
        zle yank-pop
    else
        zle yank
    fi
}
zle -N yank-or-pop


### SECTION: Other

function noglob-command () {
    if [[ $LBUFFER =~ '^noglob.*' ]]; then
        LBUFFER=${LBUFFER/noglob[ ]/}
    else
        LBUFFER="noglob $LBUFFER"
    fi
    zle redisplay
}
zle -N noglob-command


# SECTION: FZF
__fsel() {
    local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
        -o -type f -print \
        -o -type d -print \
        -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
    eval "$cmd" | $(__fzfcmd) -m | while read item; do
        printf '%q ' "$item"
    done
    echo
}
__fzfcmd() {
    [ ${FZF_TMUX:-1} -eq 1 ] && echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

# File widget
function fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    zle redisplay
}

# CD widget - cd into the selected directory
function fzf-ls-widget() {
    local cmd="ls-dir -1 -A"
    local dir=""
    local newdir="."

    dir="${$(eval "$cmd $newdir" | fzf --prompt="$dir/ " ):-.}"
    while [ -n $dir ] && [ $dir != '.' ]; do
        newdir="$newdir/$dir"
        dir="${$(eval "$cmd $newdir" | fzf --prompt="$dir/ " ):-.}"
    done
    cd "$newdir"

    zle zle-line-init
}

# jump widget - cd into the selected fasd directory
function fzf-fasd-widget() {
    local cmd="fasd -d | sed 's:/home/romgrk:~:;/^~$/d'"
    local newdir="$(eval "$cmd" | fzf)"
    newdir="$(echo $newdir | sed s: *~:/home/romgrk: )"
    cd "$newdir"
    zle zle-line-init
}

# CD widget - cd into the selected directory
function fzf-cd-widget() {
    local cmd="${FZF_ALT_C_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
        -o -type d -print 2> /dev/null | sed 1d | cut -b3-"}"
    cd "${$(eval "$cmd" | $(__fzfcmd) +m):-.}"
    zle zle-line-init
}

# History widget - Paste the selected command from history into the command line
function fzf-history-widget() {
    local selected num
    selected=( $(fc -l 1 | $(__fzfcmd) +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r -q "${LBUFFER//$/\\$}") )
    if [ -n "$selected" ]; then
        num=$selected[1]
        if [ -n "$num" ]; then
            zle vi-fetch-history -n $num
        fi
    fi
    zle redisplay
}

__fzfz() {
  local cmd="fasd -d | awk '{print \$2}'"
  eval "$cmd" | fzf -m | while read item; do
    printf '%q ' "$item"
  done
  echo
}

fzfz-file-widget() {
  LBUFFER="${LBUFFER}$(__fzfz)"
  zle redisplay
}

zle -N fzfz-file-widget
zle -N fzf-file-widget
zle -N fzf-cd-widget
zle -N fzf-ls-widget
zle -N fzf-fasd-widget
zle -N fzf-history-widget
