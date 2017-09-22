#!/bin/bash
# Usage:
# ./radioshock-ru-sources.sh | sort -u | ./radioshock-ru-tracks.sh > radioshock-ru-tracks.txt
# or:
# cat radioshock-ru-sources.txt | sort -u | ./radioshock-ru-tracks.sh > radioshock-ru-tracks.txt

while read SOURCE; do
    >&2 echo "=== $SOURCE ==="
    curl -s "${SOURCE}" | grep -oP '(?<=</span>&nbsp;)[^<]*(?=<span class=podpis>)'
done
