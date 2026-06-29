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
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

# PNPM
export PATH="$PATH:$HOME/.local/share/pnpm/bin"

# Ruby gems
export gemdir="$HOME/.local/share/gem/ruby/3.0.0/bin"
export PATH="$PATH:$gemdir"

# fzf path export
# source "$HOME/local/share/fzf.sh"


# SECTION: other paths

export GOPATH="$HOME/.local/share/go"
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

# SECTION: secrets (gitignored, not committed)
[[ -f "$HOME/.config/zsh/secrets.zsh" ]] && source "$HOME/.config/zsh/secrets.zsh"

