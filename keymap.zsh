# File: keymap.zsh
# Date: Fri Dec 25 06:28:23 EST 2015

bindkey -N insert emacs
bindkey -A viins .viins
bindkey -A insert main

# kmap : insert, vicmd, vivis, vivli, visual
# nmap : vicmd, vivis, vivli, visual
# vmap : vivis, vivli, visual
# imap : insert

### SECTION: Keybinding functions

function kmap () {
    modes=(main insert vicmd visual)
    for k in $modes; do
        bindkey -M $k $@
    done
}
function imap () {
    modes=(main insert)
    for k in $modes; do
        bindkey -M $k $@
    done
}
function nmap () {
    modes=(vicmd visual)
    for k in $modes; do
        bindkey -M $k $@
    done
}
function vmap () {
    modes=(visual)
    for k in $modes; do
        bindkey -M $k $@
    done
}

### SECTION: Keybindings

# Line mod, etc
kmap "^[k" up-line-or-beginning-search
kmap "^[j" down-line-or-beginning-search
kmap "^[h" beginning-of-line
kmap "^[l" end-of-line


# Navigation
#kmap "^[u" cd-parent-directory
#kmap "^[p" cd-previous
#kmap "^[n" cd-next
kmap "^[," cd-previous
kmap "^[." cd-next

# Global emacs-like keymap
kmap "^P" up-history
kmap "^N" down-history

kmap "^A" beginning-of-line
kmap "^E" end-of-line
kmap "^U" backward-kill-line
kmap "^K" kill-line

nmap "^[f"  forward-word
nmap "^[b"  backward-word
nmap "^[d"  kill-word
nmap "^W"   backward-kill-word
nmap "^[^H" backward-kill-word

kmap "^F" forward-char
kmap "^B" backward-char
kmap "^D" delete-char-or-list
kmap "^H" backward-delete-char

kmap "^[p" yank-or-pop
kmap "^[y" yank-pop

# Utils
nmap "n"       noglob-command

kmap "^[w"     which-command
kmap "^[i"     run-help
kmap "^[^["    sudo-command-line

kmap "^[[1;3P" describe-key-briefly
kmap "^[[0P"   describe-key-briefly

kmap "^[x"     execute-named-cmd

# Fzf
imap "^R"  fzf-history-widget
nmap "/"   fzf-history-widget

kmap "^[o" fzf-file-widget
kmap "^[;" fzf-ls-widget
kmap "^S"  fzf-cd-widget

kmap "^[" vi-cmd-mode

# Normal mode

nmap  "^[" vi-insert

nmap   "u" undo
nmap   "U" redo

nmap  "w"  emacs-forward-word
nmap  "b"  emacs-backward-word

#kmap "^[s" transpose-words
#nmap "^[l" down-case-word
#nmap "^[u" up-case-word
#nmap "^[c" capitalize-word

# Insert mode

imap "^Z" undo
imap "^Y" redo

# underspace
imap -s "^[ " _

# imap -s "^S" "fasd -l -d | sed s:$HOME:~: | fzf\n"
# imap "^S"  fzf-fasd-widget
imap "^[s" fzf-fasd-widget
imap '^S'  fzfz-file-widget

imap "^[f" emacs-forward-word
imap "^?"  backward-delete-char
#imap "^[k" up-line-or-history
#imap "^[j" down-line-or-history
imap "^[r" replace-mode
imap "^."  insert-last-word

imap "^L"   clear-screen

# General

#imap  " "
imap "^[^I" space-complete
#imap "^I"  forward-word
#imap "^ "  autosuggest-accept
#imap "^I"   menu-expand-or-complete
imap "^[[Z" reverse-menu-complete
imap "^[a"  accept-and-hold


function getmode () {
    if [[ $KEYMAP == 'viins' || $KEYMAP == 'main' ]]; then
        if [[ $ZLE_STATE =~ .*overwrite.* ]]; then
            print 'replace'
        else
            print 'insert'
        fi
    elif [[ $KEYMAP == 'vicmd' ]]; then
        print 'normal'
    elif [[ $KEYMAP == 'vivis' ]]; then
        print 'visual'
    elif [[ $KEYMAP == 'vivli' ]]; then
        print 'visual'
    elif [[ $KEYMAP == 'viopp' ]]; then
        print 'operator'
    else
        print 'k='$KEYMAP
    fi
}

export KEYTIMEOUT=1
