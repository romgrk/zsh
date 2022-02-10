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
alias gk="git checkout"
alias gst='git status'
alias glogline="git log --oneline"
alias gds='git diff --staged'
alias gss='git stash'
alias gsp='git stash pop'
alias gr='git rebase'
alias gpf='git push --force'
alias gpu='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gcm='git commit -m'
alias gaa='git add --all'
alias gcm='git commit -m'
alias gds='git diff --staged'
alias gss='git stash'
alias gsp='git stash pop'
alias gpf='git push --force'
alias bad='git bisect bad'
alias good='git bisect good'

alias npmy='npm init --yes'
alias npmi='npm install --save'
alias npmdev="npm install --save-dev"
alias npmg='npm i -g'

alias psgrep="_ ps aux | egrep"
alias pssort="_ ps aux | sort -k3"

alias ji="j -i"
alias jd="j -d"

function rg () { command rg --pretty $@ | less -F }
function hexyl () { command hexyl $@ | less -F }

alias pac='pacman -S'
alias pacr='pacman -R'
alias pacs='pacman -Ss'

alias sample="strace -o ./sample.log -p"

alias xmod="xmodmap -e"
alias xmodgrep="xmodmap -pke | grep"

alias egrep="egrep --color"

alias sed="sed -r"
alias sedn="sed -n"

alias luai="_ luarocks install"
alias powlua="/home/romgrk/lua/luapower/luajit"
alias rmrock="_ luarocks remove"

alias mydate="date '+%d %b %Y'"
alias srcp=". ~/.profile"
alias xo="xdg-open"
alias disco='while true; do printf "[38;5;$(($(od -d -N 2 -A n /dev/urandom)%$(tput colors)))m.[0m"; done'
alias fcgrep="fc-list | grep -i"
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
alias lc="lsc"
alias v="gloobus-preview"
alias pacl='pacman -Q'
alias pacu='pacman -S --noconfirm'
alias noderesolve="node -p 'require.resolve(process.argv[1])'"
alias pi='pip install'
alias babelrc='cp /home/romgrk/templates/babelrc ./.babelrc'
alias babel-install="npm install --save-dev babel-core babel-cli babel-preset-react babel-preset-es2015 babel-loader babel-plugin-transform-object-rest-spread"
alias pacgrep="pacman -Q | grep"
alias diskusage="du -sk -- * | sort -n | perl -pe '@SI=qw(K M G T P); s:^(\d+?)((\d\d\d)*)\s:." ".."	":e'"
alias jv="jq ''"
alias serve='http-server -c-1'
alias rm='gio trash'
alias xml-format='xmllint --format -'
alias rg-ls='rg --files-with-matches'
alias docker-compose='sudo docker-compose'
alias apti='sudo apt-get install'
function apts () { apt-cache search $1 | less -F }
alias rg-ls='rg --files-with-matches'
alias clip='xsel -b -i'
alias put='xsel -b'
alias lsone='ls --color=never -1'
alias gemini-query='gemini query /home/rgregoir/data/gemini.db --header -q'
alias l="ls_or_cat"
alias lo='cd /home/rgregoir/.local'
alias build='yarn build'
alias aptu='sudo apt-get remove'
alias guillimin="ssh romgrk@guillimin.clumeq.ca"
alias pyy="bpython"
alias pipi='sudo pip install'
alias todo='rg "(TODO|FIXME|\bXXX\b)"'
alias pyy3="bpython3"
alias activate='source ./env/bin/activate'
alias aptp='apt-cache policy'
alias gdbrun='gdb -ex run --args'
alias ssh-test="killall ssh; ssh -N -f -L 5432:127.0.0.1:5432 rgregoir@bravotestapp.genome.mcgill.ca"
alias ssh-dev="copy-genome-password && killall ssh; ssh -N -f -L 5432:127.0.0.1:5432 rgregoir@bravodevapp.genome.mcgill.ca"
alias find-port-usage="sudo netstat -nlp | grep "
alias find-port-usage="sudo netstat -nlp | grep "
alias cat="bat"
alias catt='\cat'
alias preview="fzf --preview 'bat --color "always" {}'"
alias rebuild-edcc="ssh ihec-dev.vhost38 'cd /home/ihec/edcc/source_code/edcc_portal/ihec/ && git pull && npm run build && sudo systemctl restart ihec'"
alias refresh-edcc="ssh ihec-dev.vhost38 'cd /home/ihec/edcc/source_code/edcc_portal/ihec/ && git pull && sudo systemctl restart ihec'"
alias rebuild-triton="ssh legacyportaldev.genome.mcgill.ca 'cd /home/rgregoir/workspace/mugc_data_portal && git pull && npm run build && sudo systemctl restart triton'"
alias rebuild-varwig="ssh legacyportaldev.genome.mcgill.ca 'cd /opt/varwig/ && git pull && npm i && npm run build && sudo systemctl restart varwig'"
alias gg="lazygit"
alias stop='sudo systemctl stop'
alias start='sudo systemctl start'
alias copy-clarity-password="cat ~/documents/pwd.txt | clip"
alias npm-set-prefix="npm config set prefix /home/rgregoir/.cache/npm-global"
alias npm-set-prefix="npm config set prefix /home/rgregoir/.cache/npm-global"
alias npm-delete-prefix="npm config delete prefix"
alias gdb-run='gdb -ex run --args'
alias git-discard='git checkout -f --'
alias path='echo $PATH | sed -e "s/:/\n/g"'
alias configure-debug='./configure CFLAGS="-ggdb3 -O0" CXXFLAGS="-ggdb3 -O0" LDFLAGS="-ggdb3"'
alias rrm="/bin/rm"
alias get-magic-token='curl -k --user c3cHva2-fFmWaxJt8KsbUw..:zh-1h8thUsz2z2GL0PmScg.. --data "grant_type=client_credentials" https://medbeta.medicine.mcgill.ca/ords-uat/genome/oauth/token 2>/dev/null | fx ".access_token"'
alias amen='git commit --ammend --no-edit'
alias rgi='rg -i'
alias npx-prettier-write='npx prettier --write'
alias npx-prettier-write-all-js="npx-prettier-write src/**/*.js"
alias status='sudo systemctl status'
alias clone="git clone $(put)"
alias path='echo $PATH | sed -e "s/:/\n/"'
alias rgi='rg -i'
alias pyu='pacman -Syu --noconfirm'
alias mkvirtualenv="python3 -m venv env"
alias ll='ls -lh'
alias pip-install='pip install -r requirements.txt'
alias glo='git log-pretty'
alias weather='curl http://wttr.in/'
alias tmp="cd ~/tmp"
alias dl="cd ~/downloads"
alias gh="cd ~/github"
alias amen='git commit --amend --no-edit'
alias weather='curl http://wttr.in/'
alias update-auspice='ssh web@132.219.136.217 ./update_auspice.sh'
alias start-auspice="j auspice && ./auspice.js develop --datasetDir data"
alias glb="git pull && npm run build"
alias lines='wc -l'
alias r-clean='find . -type f -name ._* -delete'
alias pacman-clear-cache='sudo pacman -Sc'
alias remove-decorations='xprop -f _MOTIF_WM_HINTS 32c -set _MOTIF_WM_HINTS "0x2, 0x0, 0x0, 0x0, 0x0"'
alias icat="kitty +kitten icat"
alias copy-dotfiles-install="echo 'mkdir -p ~/.config && cd ~/.config && git clone https://github.com/romgrk/dotfiles && ./dotfiles/install' | clip"
alias chars='wc -c'
alias npm-scripts="cat package.json | jq .scripts"
alias configure-debug='CPPFLAGS=-DDEBUG CFLAGS="-g -O0" CXXFLAGS="-g -O0" ./configure'
alias rp="realpath"
alias npmu='npm uninstall'
alias npm="pnpm"
