#!/usr/bin/env bash

if [ -z "$2" ]
then
  DSID_ARG=''
else
  DSID_ARG="--dsids=$2"
fi

if [ -z "$1" ]
then
  echo "Need to specifiy a file of PIDs"
else
  PID_FILE=$1
  PID_COUNT=$(cat $PID_FILE | wc -l)
  PADDED_PID_COUNT=$(printf "%04d\n" $PID_COUNT)
  ITERATOR=1
  while read -r LINE
  do 
    TIME=$(date)
    PADDED_ITERATOR=$(printf "%04d\n" $ITERATOR)
    echo "$TIME: Processing $LINE (page $PADDED_ITERATOR of $PADDED_PID_COUNT)..."
    drush -u 1 --root=/var/www/html idr --force $DSID_ARG --pids=$LINE
    ITERATOR=$(expr $ITERATOR + 1)
  done < $PID_FILE > $PID_FILE.log 2>&1
fi
