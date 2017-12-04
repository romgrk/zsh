alias _=sudo

alias ls="ls --group-directories-first --color=always"
alias la="ls -vA"
alias ll='ls -lhG'
alias lla='ls -lhvGA'

alias c="clear"
alias hh="cd $HOME"

alias h=helpless

alias which-command=which

alias hello='echo world'
alias calc='noglob calc'

alias npmy='npm init --yes'
alias npmi='npm install --save'
alias npmdev="npm install --save-dev"
alias npmg="_ npm install --global"
alias npmu="npm uninstall --save"

alias psgrep="_ ps aux | egrep"
alias pssort="_ ps aux | sort -k3"

alias ji="j -i"
alias jd="j -d"

alias pac='pacman -S'
alias pacr='pacman -R'
alias pacs='pacman -Ss'

# Friendly-find
alias ff="noglob friendly-find"
#alias fff="ff ff_flags"
#alias ffq="fff -e -i -q"
alias ffs="ff -e -s"
#alias ffa="noglob fff -e -i -a"
alias ffd='ff -t d'
alias ffd="ff -t d -D 0"
alias ffd="ff -t d -D 0 -0"
alias dirdo="ff -t d -D 0 -0"
#alias -g ff_flags="--entire --case-insensitive"
#alias -g each=" | xargs -0 -I {} "

alias sample="strace -o ./sample.log -p"

alias xmod="xmodmap -e"
alias xmodgrep="xmodmap -pke | grep"

alias git="hub"
alias gk="git checkout"

alias egrep="egrep --color"
alias ngrep="grep  --color=none --exclude-dir={.bzr,CVS,.git,.hg,.svn}"

alias sed="sed -r"
alias sedn="sed -n"

alias luai="_ luarocks install"
alias powlua="/home/romgrk/lua/luapower/luajit"
alias rmrock="_ luarocks remove"

alias mydate="date '+%d %b %Y'"
alias srcp=". ~/.profile"
alias clone="git clone"
alias xo="xdg-open"
alias disco='while true; do printf "[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.[0m"; done'
alias fcgrep="fc-list | grep -i"
alias glogline="git log --oneline"
alias car="cat"
alias now='date +%T'
alias atq='_ atq'
alias atrm='_ atrm'
alias mmv='zmv -n'
alias gv="gloobus-preview"
alias launch="gtk-launch"
alias rocks='_ luarocks-5.1'
alias kall="killall"
alias gyp="node-gyp"
alias catjson="jq ''"
alias json="catjson"
alias dircolorsToVifm="vifm-convert-dircolors -e > .config/vifm/colors/Default.vifm"
alias editmod="nvim ~/local/bin/xmod_remap"
alias nv="nvim-wrapper"
alias editautojump="edit ~/.local/share/autojump/autojump.txt"
alias desktop-item-create='gnome-desktop-item-edit --create-new /home/romgrk/Desktop'
alias gst='git status'
alias x="extract"
alias _pac="pacman"
alias j="z"
alias jr='fasd -D'
alias pkv='pkg-config --modversion'
alias lastpart='echo $(clip -o) | fex /-1'
alias clo='clone `clip -o` && cd `lastpart` && clear && la'
alias pacn='pacman -S --needed --noconfirm'
alias pss="yaourt -Ss"
alias pacman="yaourt"
alias lo='cd /home/romgrk/.local'
alias lc="lsc"
alias v="gloobus-preview"
alias pacl='pacman -Q'
alias pacu='pacman -S --noconfirm'
alias noderesolve="node -p 'require.resolve(process.argv[1])'"
alias lvim="/home/romgrk/github/neovim/build/bin/nvim"
alias grep="noglob grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias pi='pip install'
alias babelrc='cp /home/romgrk/templates/babelrc ./.babelrc'
alias babel-install="npm install --save-dev babel-core babel-cli babel-preset-react babel-preset-es2015 babel-loader babel-plugin-transform-object-rest-spread"
alias pacgrep="pacman -Q | grep"
alias amen='git commit --amen'
alias diskusage="du -sk -- * | sort -n | perl -pe '@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:." ".."	":e'"
alias jv="jq ''"
alias apti='sudo apt-get install'
alias apts='apt-cache search'
alias gds='git diff --staged'
alias rg-ls='rg --files-with-matches'
alias gss='git stash'
alias gsp='git stash pop'
alias gr='git rebase'
alias gpf='git push --force'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias clip='xsel -b -i'
alias put='xsel -b'
alias lsone='ls --color=never -1'
alias build='npm run build'
alias gemini-query='gemini query /home/rgregoir/data/gemini.db --header -q'
alias csvtojson-tab="csvtojson --delimiter='\t'"
alias docker-compose='sudo docker-compose'
alias gcm='git commit -m'
alias l="ls_or_cat"
alias npmitmp='cd /home/rgregoir/tmp'
alias npmitmp="cd ~/tmp && npm i"
alias todo='rg -i "fixme|todo" `git rev-parse --show-toplevel`'
