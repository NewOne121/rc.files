#PS1 customization
#http://bashrcgenerator.com/
<<<<<<< HEAD
#	@

export PYTHONSTARTUP=$HOME/.pystartup

tty -s && export PS1="\[\033[38;5;43m\]\u\[$(tty -s && tput sgr0)\]\[\033[38;5;15m\]%\[$(tty -s && tput sgr0)\]\[\033[38;5;229m\]\h\[$(tty -s && tput sgr0)\]\[\033[38;5;15m\]:\[$(tty -s && tput sgr0)\]\[\033[38;5;211m\]\W\[$(tty -s && tput sgr0)\]\[\033[38;5;15m\]> \[$(tty -s && tput sgr0)\]"
=======
export TERM=xterm
export PS1="\[\033[38;5;43m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]%\[$(tput sgr0)\]\[\033[38;5;229m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;211m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"
>>>>>>> 1efca0ef12e85221878e18232f3ebc6da96ea272

###Some customs###
shopt -s histappend
shopt -s checkwinsize

###Aliases###
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
