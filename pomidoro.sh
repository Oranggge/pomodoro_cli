#!/bin/sh
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

read -p "Which time?"

countdown $REPLY
play /home/mlappi/Github/study/pomidoro/cut_music_timer.mp3