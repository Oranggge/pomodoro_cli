#!/bin/sh
source ./.env
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

while getopts w:b:c: flag
do 
  case "$flag" in 
    w) WORK=${OPTARG};;
    b) BREAK=${OPTARG};;
    c) CIRCLE=${OPTARG}
  esac
done

echo $WORK $BREAK $CIRCLE

set -o history

if [ -z "$WORK" ]
then 
  read -p "How long should work be?" WORK
fi 

if [ -z "$BREAK" ]
  then 
  read -p "How long should break be?" BREAK
fi

if [ -z "$CIRCLE" ]
  then 
  read -p "How many cicles should it be?" CIRCLE
fi

for ((c=1; c<=$CIRCLE; c++))
do 
  read -p "press enter to start a work"
  echo "You are doing $c CIRCLE"
  countdown $WORK
  play $SONG
  read -p "press enter to start a break"
  countdown $BREAK
  play $SONG
done

