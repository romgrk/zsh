# 𝛌 𝛌 λ 𝝺
#zsh_prompt="𝝺"
# autoload -Uz colors && colors
# setopt prompt_subst

function prompt_exit_status() {
  if [ $? -eq 0 ]; then
    echo "%{$fg_bold[green]%}»%{$reset_color%}"
  else
    echo "%{$fg_bold[red]%}»%{$reset_color%}"
  fi
}

function prompt_git_branch() {
  if [ -e "$PWD/.git" ]; then
    local branch=$(git rev-parse --abbrev-ref HEAD)

    if [[ $(git status) =~ "nothing to commit, working directory clean" ]]; then
      echo -n "%{$fg_bold[green]%}($branch)%{$reset_color%}"
    else
      echo -n "%{$fg_bold[red]%}($branch)%{$reset_color%}"
    fi
  fi
  echo " "
}

function prompt_directory() {
  echo "%{$fg_bold[cyan]%}%c%{$reset_color%}"
}

function prompt_jobs () {
  count=$( ( jobs ) | wc -l)

  ((count)) && echo -n "{${count} hidden} "
}

function get_rprompt () {
    branch=`git branch 2&>/dev/null | sed -n -e '/\*/ {s/\s*\*\s*//;p}'`
    if [[ -n $branch ]]; then
        $ZSHDOT/bin/prompt git $branch
    else
        print "%F{red}%T%f"
    fi
}

function _mode_cursor () {
    [[ $1 =~ 'normal' ]]   && echo -en "\e[1 q" # block, blink
    [[ $1 =~ 'replace' ]]  && echo -en "\e[3 q" # under, blink
    [[ $1 =~ 'insert' ]]   && echo -en "\e[5 q" # beam,  blink
    [[ $1 =~ 'operator' ]] && echo -en "\e[4 q" # under, no-blink
    [[ $1 =~ 'visual' ]]   && echo -en "\e[4 q" # under, no-blink
}

function _mode_color () {
    [[ $1 =~ 'insert' ]]   && xfg 34
    [[ $1 =~ 'normal' ]]   && xfg 12
    [[ $1 =~ 'replace' ]]  && xfg 11
    [[ $1 =~ 'operator' ]] && xfg 42
    [[ $1 =~ 'visual' ]]   && xfg 13
}

function _zsh_prompt () {
    branch=`git branch 2&>/dev/null | sed -n -e '/\*/ {s/\s*\*\s*//;p}'`
    if [[ -n $branch ]]; then
        print -n " %{`xfg 99`%}  " # 
    else
        print -n " %{`xprint 246 - 1`%}  "
    fi

    print -n "%{`xprint 246 - 1`%}%~ "
    print -n "%(?.%{`_mode_color $1`%}.%{`xfg 9`%})"
    print -n "𝝺"
    print -n "%{`echo -en "\e[0m"`%} "
    print -n "%{`_mode_cursor $1`%}"
}

#function zle-line-init zle-keymap-select {
    #mode=`getmode`
    # if [[ -z $zsh_prompt ]]; then
    #PROMPT="$($ZSHDOT/bin/prompt $mode)"
    # else
        # PROMPT=$(_zsh_prompt $mode)
    # fi
    #RPS1="`get_rprompt`"
    # RPS1="`_mode_cursor $mode``prompt_git_branch`"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

#PS1="..."
#PS2="$($ZSHDOT/bin/prompt PS2)"
# RPS1="`get_rprompt`"

# export PROMPT='$(prompt_exit_status) $(prompt_directory) $(prompt_jobs)$(prompt_git_branch)'
