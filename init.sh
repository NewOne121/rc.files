#!/bin/bash

###Arguments
while getopts 'u:r' option
do
case "${option}"
in
u) ARGUSER=${OPTARG};;
r) REVERT="TRUE";;
esac
done

###Functions

sechecks() {
if [ $(su $USER -c "grep $USER /etc/passwd" > /dev/null 2>&1; echo $?) = "1" ];
then
 echo "User $USER does not exist, aborting."
 kill -9 $$ > /dev/null 2>&1;
 elif [ ! -d $(eval echo ~$USER) ];
 then
  echo "Homedir does not exist for this user, aborting."
  kill -9 $$ > /dev/null 2>&1;
 fi
}

revert () {
echo "REVERT ACTIVE"
echo "Current user is $USER"
HOME=$(eval echo "~$USER")
if [ ! -d $HOME/.rcbackup ];
then
 echo "Backup dir does not exist, terminating script.";
 kill -9 $$
else
 for backrcfile in $HOME/.rcbackup/*; do
  cp $backrcfile $HOME/$(basename ${backrcfile%.*})
  echo "Revert completed. Files are not sourced."
 done
fi
}

###Process parameters
if [ -z "$REVERT$ARGUSER" ];
then
 echo "Options are not set. Continue in default mode."
 elif [ -n $REVERT ];
 then
  if [ -z $ARGUSER ];
  then
   revert
  else
   USER=$ARGUSER
  fi
 elif [ -n $ARGUSER ]
  then
   USER=$ARGUSER
   HOME=$(eval echo "~$USER")
fi

###Process routine
#Make sure that we have backups. If not, then make it.
echo "Current user is $USER"
sechecks
if [ ! -d $HOME/.rcbackup ];
then
 mkdir $HOME/.rcbackup
 cp $HOME/* $HOME/.rcbackup
else
 if [ $(ls -A $HOME/.rcbackup/* | wc -l) -lt "100" ];
 then
  echo "Backup directory already exists. Will add current files to existing backup."
  if [ -d $HOME/.rcbackup/$(date +%Y%m%d) ];
  then 
  echo "Backup directory with today's date already exists, it will be wiped nad overwritten. Continue if you do what's you are doing."
   read -p "Continue [y/n] : " dec
   if [ $dec = "y" ]
   then
    rm -r $HOME/.rcbackup/$(date +%Y%m%d)
   else
    echo "Aborting."
    kill -9 $$ > /dev/null 2>&1
   fi
  fi
  mkdir -p $HOME/.rcbackup/$(date +%Y%m%d)
  cp $HOME/\.[a-z]* $HOME/.rcbackup/$(date +%Y%m%d) > /dev/null 2>&1
 else
  echo "Too much backup files exists, probably something wrong, aborting."
  kill -9 $$
 fi
fi

###Copy preset configs
SRCDIR="$( cd ${0%/*} && pwd -P )"
for item in $SRCDIR/*; do
if [ "${item/*\./}" = "bashrc" ]
 then
  if [ "$USER" = "root" ]
   then
    if [ "$(basename "${item%\.*}")" = "root" ];
     then
      cp $item $HOME/.bashrc
     else
      true
    fi
  else
   if [ "$(basename "${item%\.*}")" = "user" ];
    then
     cp $item $HOME/.bashrc
   fi
  fi
 elif [ "$(basename "$item")" = "init.sh" ];
  then
   true
 else
  cp $item $HOME/.$(basename "$item")
fi
done

###Apply new bashrc
echo "Don't forget to:"
echo "source $HOME/.bashrc"
