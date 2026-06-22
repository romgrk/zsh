# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umast 022


# Very important or system not happy
[[ -z $LANG ]] && export LANG="en_US.UTF-8"


export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

export CACHE="$HOME/.cache"
export CONF="$HOME/.config"
export CONFIG="$HOME/.config"


# SECTION: $PATH

# Local executables
export PATH="$HOME/bin:$PATH"

# PNPM
export PATH="$PATH:$HOME/.local/share/pnpm/bin"

# Ruby gems FIXME
export gemdir="$HOME/.gem/ruby/2.3.0/bin"
export PATH="$PATH:$gemdir"

# fzf path export
# source "$HOME/local/share/fzf.sh"


# SECTION: other paths

export GOPATH="$HOME/.gopath"
export PATH=$PATH:${GOPATH//://bin:}/bin

# ZSH path
export ZSHDOT="$HOME/.config/zsh"
export ZDOTDIR="$HOME/.config/zsh"

# Package Config
export PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig"

# SECTION: applications vars

# Neovim
export VISUAL="nvim"
export EDITOR="nvim"

# LS colors
eval "$(dircolors $HOME/.config/dircolors)"
# export LS_COLORS=...

