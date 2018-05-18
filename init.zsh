# File: init.zsh

### SECTION: Globals {1

source $HOME/.profile

export fpath=($HOME/.cache/zsh $fpath)

export HISTFILE="$ZSHDOT/.history"
export ZSH_ALIASES="$ZSHDOT/aliases.zsh"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'

[[ -f $CONFIG/less_termcap ]] && source "$CONFIG/less_termcap"
[[ -f $CONFIG/dircolors ]]    && eval "$(dircolors $CONFIG/dircolors)"


# Autoenv options

AUTOENV_AUTH_FILE="$XDG_CACHE_HOME/autoenv_auth"
AUTOENV_IN_FILE=".env" #default
AUTOENV_OUT_FILE=".out" #default
COLORS=true #default



### SECTION: Init sequence {1


# Zsh options
source "$ZSHDOT/setup.zsh"
autoload -U zmv

# Plugins
source "$ZSHDOT/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundles <<EOB
    git
    sudo
    horosgrisa/autoenv
    t413/zsh-background-notify
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOB
antigen apply

eval "$(fasd --init auto)"
source "$ZSHDOT/plugins/fzf.zsh"

compdef g=hub

# Scripts
source "$ZSHDOT/functions.zsh"
source "$ZSHDOT/editor.zsh"

# Welcome message
[[ -z $MYVIMRC ]] && welcome

# source "$ZSHDOT/prompt.zsh"
source "$ZSHDOT/promptline.sh"

source "$ZSHDOT/keymap.zsh"
source "$ZSHDOT/aliases.zsh"



### SECTION: Terminal specific settings {1

#[[ $TERM == 'linux' ]]                   && source $ZSHDOT/term/linux.zsh
[[ $COLORTERM == 'drop-down-terminal' ]] && source $ZSHDOT/term/dropdown.zsh
[[ -n $DROPDOWNTERM ]] && source $ZSHDOT/term/dropdown.zsh
#[[ $COLORTERM == 'rox-term' ]]           && source $ZSHDOT/term/roxterm.zsh

unset -f nmap
