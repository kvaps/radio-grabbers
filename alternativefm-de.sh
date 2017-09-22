#!/bin/bash
# Usage:
# ./alternativefm-de.sh begin > alternativefm-de-tracks.txt
# cat alternativefm-de-tracks.txt | awk -F'|' '{print $3 "|" $4 }' | sort | uniq -c | sort -k1nr

TODAY=$(date +%d.%m.%Y)

FIRSTDATE="18.01.2017"

FROMDATE=${1:-$TODAY}
TODATE=${2:-$TODAY}

[ "$FROMDATE" == "begin" ] && FROMDATE="$FIRSTDATE"

export LANG=de_DE.UTF-8

for DATE in $(dateseq -i %d.%m.%Y -f %d.%m.%Y "$FROMDATE" "$TODATE"); do

    for HOUR in {00..23}; do

    >&2 echo "===== $DATE $HOUR ====="
    curl -s 'http://www.alternativefm.de/includes/php/playlist_datenbank.php' --data 'do=Playlist&datum='$DATE'&Stunde='$HOUR'&BTN_suchen=suchen' | sed -n 's:.*<table>\(.*\)</table>.*:\1:p' | sed 's|</\?tr>|\n|g' | grep "<td valign='top'>" | sed 's|</\?td[^>]*>|\||g' | sed 's/|\+/|/g'

    done


    

done
