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

# Some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias systemctl='systemctl --no-pager'

#Kubectl aliases
if [ -f '/usr/local/bin/kubectl' ];
then
  kubectl completion bash > /dev/null
  alias kubestat='systemctl status kube-apiserver kube-controller-manager kubelet kube-proxy etcd'
  alias kubeoff='systemctl stop kube-apiserver kube-controller-manager kubelet kube-proxy etcd'
  alias kubeon='systemctl start kube-apiserver kube-controller-manager kubelet kube-proxy etcd'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Enable Completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## Promt
export PS1="\[\033[38;5;160m\]\u\[$(tput sgr0)\]\[\033[38;5;122m\]!\[$(tput sgr0)\]\[\033[38;5;39m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;178m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]> \[$(tput sgr0)\]"

###PYTHON
export PYTHONSTARTUP="/root/.pystartup"
