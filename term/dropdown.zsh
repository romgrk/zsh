
# F11 & S-F11 = sizeup/sizedown
function _dropdown_h_normal () {
    dropdownterminal h 50%
}
function _dropdown_h_expand () {
    dropdownterminal h 80%
}
function _dropdown_h_full () {
    dropdownterminal h 100%
}
zle -N _dropdown_h_normal
zle -N _dropdown_h_expand
zle -N _dropdown_h_full

function _dropdown_light () {
    dropdownterminal bg 'rgba(0,0,0,0.4)'
}
function _dropdown_dark () {
    dropdownterminal bg 'rgba(0,0,0,0.7)'
}
function _dropdown_bg () {
    #printhl -3 'Opacity [0-9]?'
    zle -R 'Opacity [0-9]?'
    zle reset-prompt
    read -s -k 1 char
    if   [[ "$char" == '-' ]]; then
        dropdownterminal bg 'rgba(0,0,0,0.4)'
    elif [[ "$char" == '=' ]]; then
        dropdownterminal bg 'rgba(0,0,0,0.7)'
    elif [[ "$char" == '+' ]]; then
        dropdownterminal bg 'rgba(0,0,0,0.9)'
    elif [[ "$char" == '0' ]]; then
        dropdownterminal bg 'rgba(0,0,0,1.0)'
    elif [[ $char =~ '\d' ]]; then 
        eval "dropdownterminal bg 'rgba(0,0,0,0.$char)'"
    else
        zle -R "Invalid value: '$char'\n"
        return
    fi
    zle reset-prompt
}
zle -N _dropdown_bg
zle -N _dropdown_dark
zle -N _dropdown_light

kmap "^[[23~"   _dropdown_h_normal
kmap "^[[23;3~" _dropdown_h_expand
kmap "^[[23;5~" _dropdown_h_full

kmap "^[[21~"   _dropdown_bg

export TERM='xterm-256color'

