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

read -p "How long should work be?" WORK

read -p "How long should break be?" BREAK

read -p "How many cicles should it be?" CIRCLE

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

