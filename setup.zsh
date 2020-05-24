
autoload -U zmv
autoload -U colors
autoload -U zsh-mime-setup
autoload -U select-word-style

colors          # colors
zsh-mime-setup  # run everything as if it's an executable
select-word-style bash # ctrl+w on words

##
# Vcs info
##
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%c%{$fg[green]%}%u%{$reset_color%} [%{$fg[blue]%}%b%{$reset_color%}] %{$fg[yellow]%}%s%{$reset_color%}:%r"
# precmd() # run before each prompt
  #vcs_info
#}

##
# Prompt
##
setopt PROMPT_SUBST     # allow funky stuff in prompt
color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;
prompt="%{$fg[$color]%}%n%{$reset_color%}@%U%{$fg[yellow]%}%m%{$reset_color%}%u %T %B%~%b "
RPROMPT='${vim_mode} ${vcs_info_msg_0_}'

##
# Completion
##
autoload -U compinit
compinit -i
zmodload -i zsh/complist
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete aliases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.
setopt menu_complete            # Insert first item on tab

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb

# Style

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format $'\e[01m%d'
zstyle ':completion:*:messages'     format $'\e[01m%d'
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

users=(admin romgrk root)           # because I don't care about others

zstyle ':completion:*' users $users
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


##
# Pushd
##
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`

##
# History
##
#HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=4096                   # big history
SAVEHIST=4096                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
setopt hist_ignore_space        # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, dont wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

##
# Various
##
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt clobber                  # No file-exists error on pipe redirection
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
# setxkbmap -option compose:ralt  # compose-key
print -Pn "\e]0; %n@%M: %~\a"   # terminal title


bindkey -v      # vi mode
vim_ins_mode="%{$fg[yellow]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[cyan]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

echo -en "\e[5 q"

function zle-keymap-select zle-line-init {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  if [[ $vim_mode =~ "CMD" ]]; then
    echo -en "\e[1 q"
  else
    echo -en "\e[5 q"
  fi
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
