
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=248'


# from https://github.com/zdharma/fast-syntax-highlighting/blob/7108a135e1ab920c6108f0c6936600617e07d05b/fast-highlight#L54
typeset -A FAST_HIGHLIGHT_STYLES

# Default blue doesn't render nicely in some terminals
local blue=39

# FAST_HIGHLIGHT_STYLES[default]='none'
# FAST_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
# FAST_HIGHLIGHT_STYLES[reserved-word]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[subcommand]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[alias]='fg=green'
# FAST_HIGHLIGHT_STYLES[suffix-alias]='fg=green'
# FAST_HIGHLIGHT_STYLES[global-alias]='bg=blue'
# FAST_HIGHLIGHT_STYLES[builtin]='fg=green'
# FAST_HIGHLIGHT_STYLES[function]='fg=green'
# FAST_HIGHLIGHT_STYLES[command]='fg=green'
# FAST_HIGHLIGHT_STYLES[precommand]='fg=green'
# FAST_HIGHLIGHT_STYLES[commandseparator]='none'
# FAST_HIGHLIGHT_STYLES[hashed-command]='fg=green'
# To have paths colored instead of underlined
FAST_HIGHLIGHT_STYLES[path]='fg=magenta'
FAST_HIGHLIGHT_STYLES[path-to-dir]='fg=#B460FF'
FAST_HIGHLIGHT_STYLES[path_pathseparator]='fg=#8700ff'
FAST_HIGHLIGHT_STYLES[globbing]="fg=$blue"
# FAST_HIGHLIGHT_STYLES[globbing-ext]='fg=13'
FAST_HIGHLIGHT_STYLES[history-expansion]="fg=$blue,bold"
# FAST_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[back-quoted-argument]='none'
# FAST_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[back-or-dollar-double-quoted-argument]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
# FAST_HIGHLIGHT_STYLES[assign]='none'
# FAST_HIGHLIGHT_STYLES[redirection]='none'
# FAST_HIGHLIGHT_STYLES[comment]='fg=black,bold'
# FAST_HIGHLIGHT_STYLES[variable]='fg=113'
FAST_HIGHLIGHT_STYLES[mathvar]="fg=$blue,bold"
# FAST_HIGHLIGHT_STYLES[mathnum]='fg=magenta'
# FAST_HIGHLIGHT_STYLES[matherr]='fg=red'
# FAST_HIGHLIGHT_STYLES[assign-array-bracket]='fg=green'
# FAST_HIGHLIGHT_STYLES[for-loop-variable]='none'
# FAST_HIGHLIGHT_STYLES[for-loop-operator]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[for-loop-number]='fg=magenta'
# FAST_HIGHLIGHT_STYLES[for-loop-separator]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[here-string-tri]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[here-string-text]='bg=18'
# FAST_HIGHLIGHT_STYLES[here-string-var]='fg=cyan,bg=18'
# FAST_HIGHLIGHT_STYLES[case-input]='fg=green'
# FAST_HIGHLIGHT_STYLES[case-parentheses]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[case-condition]='bg=blue'
# FAST_HIGHLIGHT_STYLES[paired-bracket]='bg=blue'
# FAST_HIGHLIGHT_STYLES[bracket-level-1]='fg=green,bold'
# FAST_HIGHLIGHT_STYLES[bracket-level-2]='fg=yellow,bold'
# FAST_HIGHLIGHT_STYLES[bracket-level-3]='fg=cyan,bold'
# FAST_HIGHLIGHT_STYLES[single-sq-bracket]='fg=green'
# FAST_HIGHLIGHT_STYLES[double-sq-bracket]='fg=green'
# FAST_HIGHLIGHT_STYLES[double-paren]='fg=yellow'
# FAST_HIGHLIGHT_STYLES[correct-subtle]='fg=12'
# FAST_HIGHLIGHT_STYLES[incorrect-subtle]='fg=red'
# FAST_HIGHLIGHT_STYLES[subtle-separator]='fg=green'
# FAST_HIGHLIGHT_STYLES[subtle-bg]='bg=18'
# FAST_HIGHLIGHT_STYLES[secondary]='free'
