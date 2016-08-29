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
  fi;;
esac

if [ ! -f ~/pystartup ]
 then
  ln -s ~/rc.files/pystartup ~/.pystartup &&
  . ~/.pystartup
  touch ~/.pyhistory
fi
