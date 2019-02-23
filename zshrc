#zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000
setopt autocd
setopt correct
setopt sunkeyboardhack
unsetopt beep
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
autoload -U colors && colors

#colorize
alias grep='grep --color'
alias ccat='pygmentize -g -O style=colorful'
alias clcat='pygmentize -g -O style=colorful,linenos=1'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export COLORFGBG=''
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.tbz=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:'
export LESS=FRSX

function man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    LESS='-j 8' \
    man "$@"
}

#file alias
alias -s odt=ooffice
alias -s pdf=evince

#env
export CVS_RSH=ssh
export SHELL=/bin/zsh
export JAVA_HOME=$HOME/java/current
export PYTHONSTARTUP=~/.pythonrc
export PATH="$HOME/bin:$HOME/.local/bin:$JAVA_HOME/bin:$PATH"
export VISUAL='vim'
alias ssh='TERM="xterm" ssh'

function cals() {als $@ | cless}
function mkcd() { mkdir $1; cd $1; }
function cless() { ccat $@ | less }

function pacS() {pacman -S $@ && source ~/.zshrc}
#shell goodies

ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
      /home/firenox/git/ranger/ranger.py $@
    else
        exit
    fi
}

background() {
  nohup $@ >/dev/null 1>&1 &
}
#bindkey -v

mountusb() {sudo mount /dev/sda1 /mnt/usb -o umask=000}
alias ll='ls++ -A'
alias cppwd='echo $PWD | xsel -b'
alias s='cless'
alias less='less -FRX'
alias ag="ag --color-match='1;31' $@"
alias agg="ag -g"
alias c7="chmod 777"
alias SirMixALot="ssh 192.168.2.107"

alias crap='cd ~/crap'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

