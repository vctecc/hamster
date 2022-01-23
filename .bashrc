# ~/.bashrc

if [ -d /usr/local/lib/locale/koi8-r ]; then
  export LANG="koi8-r"
elif [ -f ~/.locale ]; then
  . ~/.locale
  export LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY
  export LC_MESSAGES LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE
  export LC_MEASUREMENT LC_IDENTIFICATION
fi

# if [ "`uname`" == "Linux" ]; then
# 	 export PATH="/usr/X11R6/bin:/usr/local/bin:/usr/bin:/bin:/home/cf/e2k/test/e2kt:/home/cf/e2k/e2k_0.5.3/linux/bin/:/home/cf/e2k/bin"
# elif [ "`uname -i`" == "i86pc" ]; then
# 	export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
# 	export PATH="/usr/local/bin:/usr/bin:/bin:/home/cf/e2k/test/e2kt:/home/cf/e2k/e2k_0.5.3/intel/bin/:/home/cf/e2k/bin:/usr/ccs/bin"
# else
# 	export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib
# 	export PATH="/usr/local/bin:/usr/bin:/bin:/home/cf/e2k/test/e2kt:/home/cf/e2k/e2k_0.5.3/sparc/bin/:/home/cf/e2k/bin:/usr/ccs/bin"
# fi

export CVSROOT=/home/cf/ecomp.cvs

# console colors
Green='\[\e[01;32m\]'
Blue='\[\e[01;34m\]'
Reset='\[\e[00m\]'


# TODO git rev-parse --abbrev-ref HEAD
git_branch() {
  [[ -f /usr/bin/git ]] && git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [[ -f /usr/bin/git ]]; then
    GitBranch="${Blue}\$(git_branch)${Reset}"
else
    GitBranch=""
fi
export PS1="${Green}\h:${Reset}\w${GitBranch}\$ "

if [ "`hostname`" = "band" ]; then
	export DISPLAY=":0"
else
	export DISPLAY="band:0"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

##############################################################################
# default utils alias
alias ll='ls -l'
alias la='ls -a'
alias lt='ls -lt'
alias lh='ls -lh'
alias +x='chmod +x'
alias +w='chmod +w'
alias h='history | tail -25'
alias ..='cd ../'
alias rm='rm -f'
alias rdp="rdesktop"
alias cg="grep --color"
alias rlf='readlink -f'
# Midnight Commander without _AARGH_ wrong encoding symbols
#alias mc='mc -a'

# Python
alias py34='/usr/bin/python3.4'

# Utils
alias bat="$HOME/bin/bat/usr/bin/bat"
alias iperf="$HOME/bin/iperf/bin/iperf3"
alias firefox="$HOME/bin/firefox/firefox-bin"
alias sed4="$HOME/bin/sed/bin/sed"
alias xclip="$HOME/bin/xclip/usr/bin/xclip -selection c -rmlastnl"
alias htop="$HOME/bin/htop/bin/htop"
alias sqliteman="$HOME/bin/sqliteman/bin/sqliteman"
alias sublime="$HONE/bin/sublime"
alias redis="$HOME/bin/redis/bin/redis-server"
alias sqlite="$HOME/bin/sqlite3/bin/sqlite3"

# My scripts
SCRIPTS="$HOME/scripts"
alias mkln="$HOME/lintel/mkln.py"
alias clockwork="$SCRIPTS/python/clockwork/clockwork.py"
alias pivms="$SCRIPTS/bash/pivms.sh"

# work station
alias navarro='ssh -XC navarro'
alias ib1='ssh intel-pc-b1 -l tester'
alias bingen='su bingen'

alias i10b1='ssh i10-pc-b1 -l root'
alias p1b4='ssh p1-pc-b4 -l root'
alias e2sb5='ssh e2s-pc-b5 -l root'
alias p9b1='ssh p9-pc-b1 -l root'
alias p9b2='ssh p9-pc-b2 -l root'
alias foo21='ssh el2s4-53-21'
alias foo24='ssh el2s4-53-24'

alias venv="source $HOME/venv/bin/activate"
alias reports="gvim $HOME/Documents/reports/reports.txt"
alias emails="gvim $HOME/Documents/email.txt"
alias todo="gvim $HOME/Documents/todo.txt"
alias psqlbg="psql -U postgres -d bingenview"
alias xpwd="pwd | xclip"
alias aliaspc="alias | grep 'ssh ' | grep -v 'grep'"

# docs
alias gcmds="gvim $HOME/giude/commands.txt"
# Git
source ~/.git-completion.bash
alias gst='git status'
alias gg='git grep '
alias giff='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40"'
alias gf='git diff'
alias {gbra,gb}='git branch'
alias {gco}='git checkout'
alias {gcom,gc}='git commit'

__SQLITE3__=$HOME/bin/sqlite3/lib
__PYTHON__=$HOME/python39/bin
__LOCAL__=$HOME/.local/bin
__IMPORTS__=$HOME/scripts/imports
__GO__="$HOME/bin/go/bin"

export PATH=$__PYTHON__:$__LOCAL__:$__IMPORTS__:$__GO__:$PATH
export PYTHONPATH=$__PYTHON__

#export LD_LIBRARY_PATH=$__SQLITE3__:$LD_LIBRARY_PATH
#export LD_RUN_PATH=$__SQLITE3__:$LD_RUN_PATH

# cd auto complite
shopt -s cdspell

# append to the history file, don't overwrite it
shopt -s histappend
PROMT_COMMAND="history -a"

# Time and Date in history
export HISTTIMEFORMAT="%h %d %H:%M:%S "

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=10000

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:ll:lt:exit:history:clear:ps:mc:h"

# Archives
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ]; then
            case $1 in
                *.tar.bz2) tar xvjf $1 ;;
                *.tar.gz) tar xvzf $1 ;;
                *.tar.xz) tar xvJf $1 ;;
                *.lzma) unlzma $1 ;;
                *.bz2) bunzip2 $1 ;;
                *.rar) unrar x -ad $1 ;;
                *.gz) gunzip $1 ;;
                *.tar) tar xvf $1 ;;
                *.tbz2) tar xvjf $1 ;;
                *.tgz) tar xvzf $1 ;;
                *.zip) unzip $1 ;;
                *.Z) uncompress $1 ;;
                *.7z) 7z x $1 ;;
                *.xz) unxz $1 ;;
                *.exe) cabextract $1 ;;
                *) echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}
alias extr='extract '

if [[ `hostname` == "rc-093" ]]; then
    export RECIPIENTS="vaniukov_i@mcst.ru"
fi

function vmsya {
    ssh -tt navarro " VBoxManage list runningvms | grep 'ya' && ssh -p 5090 pi@localhost || echo 'need run vms"
}

function scd {
    [[ -z "$1" ]] && srv="rc-093" || srv=$1
    ssh -t $srv "cd $(pwd); bash --login"
}
