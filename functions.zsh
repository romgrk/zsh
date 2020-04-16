#!/bin/zsh

function rg () {
    command rg --pretty $@ | less
}

function aujourdhui () {
    LC_ALL=fr_CA.UTF-8 date +"\%e \%b \%Y"
}

function inplace () {
    executable=${@:1:-1}
    file=${@: -1}
    out=$(eval $executable < $file)
    if [ $? -eq 0 ]; then
        echo $out > $file
    fi
}

function find-port-usage () {
    sudo netstat -nlp | grep  $1 | awk '{ print $7 }' | sed 's/\/.*//' | head -1
}

function kill-process-using-port () {
    kill $(find-port-usage $1 | awk '{ print $7 }' | sed 's/\/.*//' | head -1)
}

function ls_or_cat() {
    file=${1:-.}
    out=$(stat $file | head -2 | tail -1)
    if [[ $out == *"directory" ]]
    then
        ls --group-directories-first --color=always $file
    else
        bat $file
    fi
}

# Welcome message
function welcome() {
    LC_ALL=fr_CA.UTF-8 date +"%e %b"
    print "\n"
    fortune -e | sed -e 's/^/\t/'
    print "\n"
}

# CMD and UNCMD are permanent alias
function cmd () {
    if [[ $# == 0 ]]; then
        sed -n '/^alias/ p' <$ZSH_ALIASES
        return 0
    elif [[ $# == 1 ]]; then
        awk '
        BEGIN { found = 0; }
        /^alias '$1'=/ { 
            match($0, /=(.*)/, arr)
            val = arr[1]
            print "cmd \x1b[32m'$1'\x1b[0m =\x1b[38;5;27m", val, 
                "\t\x1b[38;5;246m(at line ", NR, " in file '$ZSH_ALIASES')\x1b[0m";
            found = 1;
            exit 0;
        }
        END { if (found == 0) { print "cmd \x1b[91m'$1'\x1b[0m not found"; } }
        ' <$ZSH_ALIASES 
        return 0
    fi

    if [[ -w $ZSH_ALIASES ]]; then
        local aliascmd
        if [[ $# == 2 ]]; then
            aliascmd='alias '$1'="'${@:2}'"'
        else
            cmdval="${(V)@:2}"
            aliascmd="alias $1='$cmdval'"
        fi
        print ${aliascmd/alias/cmd}
        echo $aliascmd >> $ZSH_ALIASES
        eval $aliascmd
        return 0
    else
        print "Cant write file $ZSH_ALIASES"
        return 2
    fi
}
function uncmd () {
    lnum=$(sed -n "/^alias $1=/ {=}" <$ZSH_ALIASES | paste -sd "," - ) 
    if [[ -n $lnum ]]; then
        echo -e 'uncmd \x1b[93m'$1' \x1b[38;5;246m(line '$lnum')'
        #unaliased=$(sed "/^alias $1=/ d" <$ZSH_ALIASES) 
        #echo $unaliased >$ZSH_ALIASES
        unalias $1
        local ret=$(sed -iprev "/^alias $1=/ d" $ZSH_ALIASES)
        return ret
    else
        echo -e 'cmd \x1b[91m'$1'\x1b[0m not found'
        return 1
    fi
}

function helpless () {
    eval "$1 --help" | less
}
function kev () {
    xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'
}

function calc () { 
    awk "BEGIN{ print $* }" 
}

function pstree_pid () {
    pstree -p $1 | grep -o '([0-9]\+)' | grep -o '[0-9]\+'
}

function xprint () {
    # Colors:                               Attributes:
    #   [1]='red'          [black]=0        0 : Reset
    #   [0]='black'        [red]=1          1 : Bold
    #   [2]='green'        [green]=2        2 : Dim
    #   [3]='yellow'       [yellow]=3       4 : Underline
    #   [4]='blue'         [blue]=4         5 : Blink
    #   [5]='purple'       [purple]=5       7 : Inverse
    #   [6]='cyan'         [cyan]=6         8 : Hidden
    #   [7]='gray'         [gray]=7
    #   [9]='default'      [default]=9
    [[ -n $1 && $1 != '-' ]] && echo -en "\e[38;5;${1}m"
    [[ -n $2 && $2 != '-' ]] && echo -en "\e[48;5;${2}m"
    [[ -n $3 && $3 != '-' ]] && echo -en "\e[${3}m"
    [[ -n ${@:4} ]] && echo -n ${@:4}
}
function xfg() {
    [[ $1 =~ '[0-9]{1,3}' ]] && echo -en "\e[38;5;${1}m" \
                             || echo -en "\e[${color[$1]}m"
    [[ $# -gt 1 ]] && echo -n "${@:2}"
}
function xbg() {
    [[ $1 =~ '[0-9]{1,3}' ]] && echo -en "\e[48;5;${1}m" \
                             || echo -en "\e[${color[bg-$1]}m"
    [[ $# -gt 1 ]] && echo -n "${@:2}"
}
function printhl() {
    if [[ $1 =~ '^-.*' ]]; then
        echo -en "`xfg ${1:1}`"
        shift 1
    fi
    if [[ $1 =~ '^-.*' ]]; then
        echo -en "`xbg ${1:1}`"
        shift 1
    fi
    print "${@:1}"
}

#function ESC () {
    #echo -en "\e[${1}m"
#}
