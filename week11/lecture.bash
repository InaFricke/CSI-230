#!bin/bash

file="/var/log/apache2/access.log"

#tail -n 5 "$file"
function pageCount(){

results=$(cat "$file" | cut -d' ' -f7 | sort -n | uniq -c)
}
pageCount
echo "$results"
