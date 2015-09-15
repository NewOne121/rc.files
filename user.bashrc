#PS1 customization
#http://bashrcgenerator.com/
#	@
export PS1="\[\033[38;5;43m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]%\[$(tput sgr0)\]\[\033[38;5;229m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;211m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"

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
echo "Bash version is: $(bash --version | grep release | sed -r 's/.*version\ (.*)\(.*\)-release.*/\1/')\"
