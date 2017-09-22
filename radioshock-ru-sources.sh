#!/bin/bash
#./radioshock-ru-sources.sh > radioshock-ru-sources.txt

for i in {a..z} {0..9} а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ ъ ы ь э ю я; do
    >&2 echo $i
    curl -s 'http://radioshock.ru/search.php' --data 'search='$i | grep -oP '(?<=")/chart/.*(?="\>)' | sed 's|^|http://radioshock.ru|'
done

