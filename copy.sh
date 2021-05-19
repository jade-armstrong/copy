#!/bin/sh

REPOSSH=<repo-SSH>
REPODIR=<repo-directory>
REPO=$REPODIR<repository>
FILE=$REPO<the-file-to-copy>
DIR=<directory-to-copy-to>

[[ ! -d $REPODIR ]] || mkdir $REPODIR
[[ ! -d $REPO ]] || git -C $REPODIR clone $REPOSSH
git -C $REPO pull
if [[ -f $FILE ]] && [[ -d $DIR ]]
then
  cp $FILE ./tmp
  echo "File copied successfully."
else
  echo "$FILE does not exist or $DIR does not exist"
fi
