#!/bin/bash

if [ -f ~/.bashrc ]
then
  mv ~/.bashrc ~/.bashrc.orig &&
  ln -s ~/rc.files/.bashrc ~/.bashrc &&
  . ~/.bashrc
        else
          ln -s ~/rc.files/.bashrc ~/.bashrc &&
          . ~/.bashrc
fi

if [ -f ~/.vimrc ]
then
  mv ~/.vimrc ~/.vimrc.orig &&
  ln -s ~/rc.files/.vimrc ~/.vimrc &&
        else
          ln -s ~/rc.files/.vimrc ~/.vimrc
fi
