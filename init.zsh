# File: init.zsh

# XXX: fix this
source "$HOME/.profile"

### SECTION: Globals {1

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}

export fpath=($HOME/.cache/zsh $fpath)
export HISTFILE="$ZSHDOT/.history"
export ZSH_ALIASES="$ZSHDOT/aliases.zsh"

source "$ZSHDOT/highlight.zsh"


# Autoenv options

AUTOENV_AUTH_FILE="$XDG_CACHE_HOME/autoenv_auth"
AUTOENV_FILE_ENTER=".autoenv"
AUTOENV_FILE_LEAVE=".autoenv.leave"
COLORS=true #default

# Colors

[[ -f $XDG_CONFIG_HOME/less_termcap ]] && source "$XDG_CONFIG_HOME/less_termcap"
[[ -f $XDG_CONFIG_HOME/dircolors ]]    && eval "$(dircolors $XDG_CONFIG_HOME/dircolors)"

### SECTION: Init sequence {1


# Plugins
source "$ZSHDOT/antigen/antigen.zsh"
antigen use oh-my-zsh
antigen bundles <<EOB
    git
    sudo
    Tarrasch/zsh-autoenv
    t413/zsh-background-notify
    zsh-users/zsh-completions
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOB
antigen apply
# z-shell/F-Sy-H
# zsh-users/zsh-syntax-highlighting

compdef g=hub

# Scripts
source "$ZSHDOT/functions.zsh"
source "$ZSHDOT/editor.zsh"

# Welcome message
[[ -z $MYVIMRC ]] && welcome

# source "$ZSHDOT/prompt.zsh"
source "$ZSHDOT/promptline.sh"

# Options
source "$ZSHDOT/setup.zsh"

# Keymap & aliases
source "$ZSHDOT/keymap.zsh"
source "$ZSHDOT/aliases.zsh"

# Other programs
# eval `fnm env` # Currently done in ~/.profile
eval "$(fasd --init auto)"
unalias sd
source "$ZSHDOT/plugins/fzf.zsh"
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

# Atuin
eval "$(atuin init zsh)"

# Less
export LESS=-iMFXRj12a#1

# pnpm
export PNPM_HOME="/home/romgrk/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


unset -f nmap


### SECTION: Local settings {1

if [ -f "$HOME/.local.zshrc" ]; then
    source "$HOME/.local.zshrc"
fi

# Run commands
if [[ $1 == eval ]]
then
    "$@"
set --
fi
