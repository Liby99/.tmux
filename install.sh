#!/bin/bash

# Get the current bash file directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# For all the files
for FILE in ".tmux.conf" ".tmux";
do
  
  # First remove the existing files
  HOMEFILE=~/$FILE
  if [ -e $HOMEFILE ]; then
    read -e -p "Detected $HOMEFILE file. Remove it? [Y/n] " YN
    if [[ $YN == "y" || $YN == "Y" || $YN == "" ]]; then
      echo "Removing $HOMEFILE"
      rm -rf $HOMEFILE
    else
      echo "Aborting"
      exit 1
    fi
  fi
  
  # Then link the repo file to home file
  CURRFILE="${DIR}/$FILE"
  echo "Linking $FILE"
  ln -s "$CURRFILE" $HOMEFILE 
done
