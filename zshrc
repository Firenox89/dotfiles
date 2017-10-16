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

# cool command prompt
PS1=$'%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m'
PS1+=$'%{\e[0;37m%}:'
PS1+=$'%{\e[0;32m%}%~'
PS1+=$'%(?.%{\e[0;37m%}.%{\e[1;31m%})> '
PS1+=$'%{\e[0m%}'
RPS1="%{$fg[green]%}%T %{$reset_color%}%"

#colorize
alias grep='grep --color'
alias ccat='pygmentize -g -O style=colorful'
alias clcat='pygmentize -g -O style=colorful,linenos=1'
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export COLORFGBG=''
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=00;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.tbz=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:'

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

function cmvn() {
    local BLUE="[0;34m"
    local RED="[0;31m"
    local LIGHT_RED="[1;31m"
    local LIGHT_GRAY="[0;37m"
    local LIGHT_GREEN="[1;32m"
    local LIGHT_BLUE="[1;34m"
    local LIGHT_CYAN="[1;36m"
    local YELLOW="[1;33m"
    local WHITE="[1;37m"
    local NO_COLOUR="[0m"
    mvn "$@" | sed \
        -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${LIGHT_GREEN}Tests run: \1$NO_COLOUR, Failures: $RED\2$NO_COLOUR, Errors: $YELLOW\3$NO_COLOUR, Skipped: $LIGHT_BLUE\4$NO_COLOUR/g" \
        -e "s/\(\[\{0,1\}WARN\(ING\)\{0,1\}\]\{0,1\}.*\)/$YELLOW\1$NO_COLOUR/g" \
        -e "s/\(\[ERROR\].*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}FAILURE.*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}SUCCESS.*\)/$LIGHT_GREEN\1$NO_COLOUR/g" \
        -e "s/\(\[INFO\] .*\)/$LIGHT_GREEN\1$NO_COLOUR/g" \
        -e "s/\(\[jamaicabuilder\] .*\)/$LIGHT_CYAN\1$NO_COLOUR/g" \
        -e "s/\(\[DEBUG\] .*\)/$LIGHT_CYAN\1$NO_COLOUR/g"
    return $PIPESTATUS
}

#edit configs
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias i3rc='vim ~/.config/i3/config'

#file alias
alias -s odt=ooffice
alias -s pdf=evince

#env
export CVSROOT=count.aicas.burg:/CVSROOT
export CVS_RSH=ssh
export SHELL=/bin/zsh
export JAVA_HOME=$HOME/java/current
export PYTHONSTARTUP=~/.pythonrc
export PATH="$HOME/bin:$JAVA_HOME/bin:$PATH"
export VISUAL='vim'

function procyon(){command $JAVA_HOME/bin/java -jar $HOME/bin/procyon.jar $@}
function tarja(){ command tar xfvz "$@" && command tar xpf Jamaica.ss }
function cals() {als $@ | cless}

#build notifies
function mvn(){ command mvn $@ && notify-send "Maven build finished" }
function make(){ command make $@ && notify-send "Make build finished" }
function ant(){ command ant $@ && notify-send "Ant build finished" }
function gradle(){ command gradle $@ && notify-send "Gradle build finished" }

function mkcd() { mkdir $1; cd $1; }
function cless() { ccat $@ | less }
function rg() {
  if [ -z "$RANGER_LEVEL" ]; then
    ranger
  else
    exit
  fi
}

#shell goodies

#bindkey -v

alias ll='ls++ -A'
alias vimser='vim .hg/patches/series'
alias cppwd='echo $PWD | xsel -b'
alias s='cless'
alias less='less -FRX'
alias ag="ag --color-match='1;31' $@"
alias agg="ag -g"
alias c7="chmod 777"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

dirsv() { 
  ll
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
zle -N                 dirsv
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey
bindkey '^[[1;3C'      dirsv

source $HOME/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

