#!/bin/bash

CURUSER=$USER

case $CURUSER in
	root)
  if [ -f ~/.bashrc ]
  then
    mv ~/.bashrc ~/.bashrc.orig &&
    ln -s ~/rc.files/root.bashrc ~/.bashrc &&
    . ~/.bashrc
          else
	    rm ~/.bashrc
            ln -s ~/rc.files/root.bashrc ~/.bashrc &&
            . ~/.bashrc
  fi
  if [ -f ~/.vimrc ]
  then
    mv ~/.vimrc ~/.vimrc.orig &&
    ln -s ~/rc.files/.vimrc ~/.vimrc
          else
	    rm ~/.vimrc
            ln -s ~/rc.files/.vimrc ~/.vimrc
  fi;;
	[a-zA-Z0-9]*)
  if [ -f ~/.bashrc ]
  then
    mv ~/.bashrc ~/.bashrc.orig &&
    ln -s ~/rc.files/user.bashrc ~/.bashrc &&
    . ~/.bashrc
          else
	    rm ~/.bashrc
            ln -s ~/rc.files/user.bashrc ~/.bashrc &&
            . ~/.bashrc
  fi
  if [ -f ~/.vimrc ]
  then
    mv ~/.vimrc ~/.vimrc.orig &&
    ln -s ~/rc.files/.vimrc ~/.vimrc
          else
	    rm ~/.vimrc
            ln -s ~/rc.files/.vimrc ~/.vimrc
  fi
esac

<<<<<<< HEAD

if [ ! -f ~/pystartup ]
 then
  ln -s ~/rc.files/pystartup ~/.pystartup &&
  . ~/.pystartup
  touch ~/.pyhistory
=======
cat >> ~/.bashrc << EOF
echo "Bash version is: \$(bash --version | grep release | sed -r 's/.*version\ (.*)\(.*\)-release.*/\1/')\"
EOF

sed -i 's/https\:\/\/github.com/https\:\/\/newone121\@github.com/g' ~/rc.files/.git/config
>>>>>>> 1efca0ef12e85221878e18232f3ebc6da96ea272
