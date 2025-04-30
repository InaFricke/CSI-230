#!/bin/bash
link="http://10.0.17.6/IOC.html"
curl -sl "$link" | grep -o '<td>[^<]*</td>' | awk 'NR%2==1' | sed 's/<td>//;s/<\/td>//' > IOC.txt
echo "IOC's pulled"
cat IOC.txt
