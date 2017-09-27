#!/bin/bash
# Usage:
# ./101-ru.sh http://101.ru/pers-playlist/userid/849748

#while true; do for i in $(curl "$1" | grep -oP '<audio[^<]*' | grep -oP 'http://[^"]*'); do wget -nc $i; done; sleep 10m; done

while true; do
    curl -s "$1" | grep -oP "((?<=alt=\")[^\"]*|http://[^\"]*)" | paste -d\| - - |
    
    while read line; do
        NAME="$(echo "$line" | awk -F\| '{print $1}')"
        URL="$(echo "$line" | awk -F\| '{print $2}')"
        FORMAT="$(echo "$line" | awk -F. '{print $NF}')"; 
        wget -nc "$URL" -O "$NAME.$FORMAT"
    done
    sleep 10m
done
