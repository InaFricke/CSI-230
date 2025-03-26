#!bin/bash

file="/var/log/apache2/access.log"

#tail -n 5 "$file"
function countingCurlAccess(){

results=$(cat "$file" | cut -d' ' -f1,12 | grep "curl" | sort -n | uniq -c)
}

countingCurlAccess
echo "$results"
