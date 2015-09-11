# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m'

export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;122m\]!\[$(tput sgr0)\]\[\033[38;5;39m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"
#export PS1="\[\e[0;31m\]\u\[\e[0;37m\]!\[\e[0;36m\]\h\[\e[0;37m\]:\[\e[0;33m\]\W\[\e[0;37m\]> \[\e[0m\]"


###BACULA
alias chbak='bacula-dir -t /etc/bacula/bacula-dir.conf'
alias bdir='cd /etc/bacula/bacula-dir'
alias bscr='cd /etc/bacula/scripts'
alias grep='grep --color=auto'
alias mds='df -h | grep md | sort -k5n'
alias sendrep='/home/ffilippov/report.sh'
