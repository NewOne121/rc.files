#!/bin/bash

CURUSER=$USER

rollback () {
if [ -f ~/.gcf ]
 then
  mv ~/.bashrc ~/.bashrc.old
  cp ~/.bashrc.orig ~/.bashrc
  . ~/.bashrc
  mv ~/.vimrc ~/.vimrc.old
  if [ -f ~/.vimrc.orig ]
  then
   cp ~/.vimrc.orig ~/.vimrc
  fi
  rm -f ~/.vim/plugin/python.vim
  else
   echo "RC configuration not been allpied ever. Nothing to rollback."
   exit 0
fi
}

case $CURUSER in
	root)
  if [ ! -f ~/.gcf ]
  then
   touch ~/.gcf
  fi
  if [ "$1" = "rollback" ]
  then
  rollback
  exit 0
  fi 
  if [ -f ~/.bashrc ]
  then
    mv ~/.bashrc ~/.bashrc.orig &&
    ln -s ~/rc.files/root.bashrc ~/.bashrc &&
    . ~/.bashrc
          else
	    rm -r ~/.bashrc
            ln -s ~/rc.files/root.bashrc ~/.bashrc &&
            . ~/.bashrc
  fi
  if [ -f ~/.vimrc ]
  then
    mv ~/.vimrc ~/.vimrc.orig &&
    ln -s ~/rc.files/.vimrc ~/.vimrc
          else
	    rm -f ~/.vimrc
            ln -s ~/rc.files/.vimrc ~/.vimrc
  fi
  if [ ! -d ~/.vim/plugin ]
  then
	mkdir -p ~/.vim/plugin
	cp ~/rc.files/python.vim ~/.vim/plugin
  fi
	;;
	[a-zA-Z0-9]*)
  if [ ! -f ~/.gcf]
  then
   touch ~/.gcf
  fi
  if [ "$1" = "rollback" ]
  then
  rollback
  exit 0
  fi 
  if [ -f ~/.bashrc ]
  then
    mv ~/.bashrc ~/.bashrc.orig &&
    ln -s ~/rc.files/user.bashrc ~/.bashrc &&
    . ~/.bashrc
          else
	    rm -f ~/.bashrc
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
	;;
esac

if [ ! -f ~/.pystartup ]
 then
  ln -s ~/rc.files/pystartup ~/.pystartup &&
  touch ~/.pyhistory
fi

. $HOME/.bashrc	
