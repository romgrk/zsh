alias _=sudo

alias ls="ls --group-directories-first --color=always"
alias la="ls -vA"
alias lla='ls -lhvGA'
alias lsf='ls -l | fzf --preview="echo user={3} when={-4..-2}; cat {-1}" --header-lines=1'

alias c="clear"
alias hh="cd $HOME"

alias h=helpless

alias which-command=which
alias grep="noglob grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias hello='echo world'
alias calc='noglob calc'

alias git="hub"
alias gst='git status'
alias glo='git log-pretty'
alias glol="git log --oneline"
alias gcm='git commit -m'
alias gaa='git add --all'
alias gcl="git commit -am lint"
alias gclp="gcl && gp"
alias gci='git commit --allow-empty -m "ci: run (empty commit)"'
alias gcip="gci && gp"
alias gmm='git merge master'
alias glmm='git fetch origin master:master && gmm' # Update master then merge it in current branch
alias gp='git push'
alias gpf='git push --force'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`' # Push branch that doesn't exist yet
alias gd='git diff'
alias gds='git diff --staged'
alias gss='git stash'
alias gsp='git stash pop'
alias gk='quick_checkout'
function quick_checkout() {
    local branch="${1:-$(git branch | fzf | sed 's/ +//;')}"
    git checkout $branch
}
alias gkm='git checkout master && git pull'
alias gkb='git checkout -b'
alias gR='git restore'
alias gRR='git restore .'
alias amen='git commit --ammend --no-edit'
alias clone="git clone $(xsel -b)" # Clone URL in clipboard
alias gre='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gbi='git bisect'
alias bad='git bisect bad'
alias good='git bisect good'

alias npmy='npm init --yes'
alias npmi='npm install --save'
alias npmg='npm i -g'

alias psgrep="_ ps aux | egrep"
alias pssort="_ ps aux | sort -k3"

alias ji="j -i"
alias jd="j -d"

function rg () { command rg --pretty $@ | less -F }
function hexyl () { command hexyl $@ | less -F }

alias pac='pacman -S'
alias pacr='pacman -Rs'
alias pacs='pacman -Ss'
alias pacss="yay -Slq | fzf --preview 'yay -Si {}' --height=97% --layout=reverse --bind 'enter:execute(yay -Si {} | less)'"

alias sed="sed -r"
alias sedn="sed -n"

alias chars='wc -c'
alias lines='wc -l'

alias cat="bat"
alias catp='cat package.json'
alias catt='\cat'
alias clip='xsel -b -i'
alias clo='clone `clip -o` && cd `lastpart` && clear && la'
alias configure-debug='./configure CFLAGS="-ggdb3 -O0" CXXFLAGS="-ggdb3 -O0" LDFLAGS="-ggdb3"'
alias configure-debug='CPPFLAGS=-DDEBUG CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure'
alias copy-clarity-password="cat ~/documents/pwd.txt | clip"
alias copy-dotfiles-install="echo 'mkdir -p ~/.config && cd ~/.config && git clone https://github.com/romgrk/dotfiles && ./dotfiles/install' | clip"
alias cpcpp="/home/romgrk/src/comparative-database-main/cpp/build/bin/comparative"
alias dircolorsToVifm="vifm-convert-dircolors -e > .config/vifm/colors/Default.vifm"
alias disco='while true; do printf "[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.[0m"; done'
alias dl="cd ~/downloads"
alias docker-compose='sudo docker-compose'
alias fcgrep="fc-list | grep -i"
alias find-port-usage="sudo netstat -nlp | grep "
alias find-port-usage="sudo netstat -nlp | grep "
alias gdb-run='gdb -ex run --args'
alias gdbrun='gdb -ex run --args'
alias gkm='git checkout master'
alias icat="kitty +kitten icat"
alias j="z"
alias jr='fasd -D'
alias jv="jq ''"
alias jxd="j mui-x && pnpm run docs:dev"
alias l="ls_or_cat"
alias lastpart='echo $(clip -o) | fex /-1'
alias lint="pr prettier && pr eslint"
alias ll='ls -lh'
alias lo='cd /home/rgregoir/.local'
alias lsone='ls --color=never -1'
alias mmv='zmv -n'
alias mount-windows='sudo mount -t ntfs /dev/nvme0n1p3 /mnt/c'
alias now='date +%T'
alias p-scripts="cat package.json | jq .scripts"
alias npmdev='pnpm install -D'
alias npmu='npm uninstall'
alias p="pnpm"
alias pacgrep="pacman -Q | grep"
alias pacl='pacman -Q'
alias pacman-clear-cache='sudo pacman -Sc'
alias pacman="yay"
alias pacn='pacman -S --needed --noconfirm'
alias pacu='pacman -S --noconfirm'
alias path='echo $PATH | sed -e "s/:/\n/"'
alias path='echo $PATH | sed -e "s/:/\n/g"'
alias pi='pnpm install'
alias pr='pnpm run'
alias preview="fzf --preview 'bat --color "always" {}'"
alias prs='pnpm run start'
alias pss="yay -Ss"
alias put='xsel -b'
alias px="pnpx"
alias pyu='pacman -Syu --noconfirm'
alias rg-ls='rg --files-with-matches'
alias rg-ls='rg --files-with-matches'
alias rgf='rg --files-with-matches'
alias rgi='rg -i'
alias rgi='rg -i'
alias rm='gio trash'
alias rp="realpath"
alias rrm="/bin/rm"
alias serve='http-server -c-1'
alias serve='pnpx serve'
alias srcp=". ~/.profile"
alias ssh-dev="copy-genome-password && killall ssh; ssh -N -f -L 5432:127.0.0.1:5432 rgregoir@bravodevapp.genome.mcgill.ca"
alias ssh-test="killall ssh; ssh -N -f -L 5432:127.0.0.1:5432 rgregoir@bravotestapp.genome.mcgill.ca"
alias start='sudo systemctl start'
alias status='sudo systemctl status'
alias stop='sudo systemctl stop'
alias tmp="cd ~/tmp"
alias todo='rg "(TODO|FIXME|\bXXX\b)"'
alias x="extract"
alias xml-format='xmllint --format -'
alias xo="xdg-open"
function apts () { apt-cache search $1 | less -F }
alias pipd="pnpm install && pnpm dedupe"
