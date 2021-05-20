#!/bin/sh

#This is a simple bash script that will copy a file from a git repository on your machine to another directory.

REPOSSH= #Enter the repo SSH key here for cloning the repo that holds the file you want to copy
REPODIR= #Enter the directory path you have or want the repo to be under e.g. ~/repos
REPO=$REPODIR/ #Enter the repo name here
FILE=$REPO/ #Enter the rest of the path from the repo of the file you want to copy
DIR= #Enter the path to the directory you want to copy the file to e.g. ~/repos/myrepo

[[ ! -d $REPODIR ]] || mkdir $REPODIR
[[ ! -d $REPO ]] || git -C $REPODIR clone $REPOSSH
git -C $REPO pull
if [[ -f $FILE ]] && [[ -d $DIR ]]
then
  cp $FILE $DIR
  echo "File copied successfully."
else
  echo "$FILE does not exist or $DIR does not exist"
fi
