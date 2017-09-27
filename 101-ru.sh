#!/bin/bash
# Usage:
# 101-ru.sh http://101.ru/pers-playlist/userid/849748

while true; do for i in $(curl "$1" | grep -oP '<audio[^<]*' | grep -oP 'http://[^"]*'); do wget -nc $i; done; sleep 10m; done
