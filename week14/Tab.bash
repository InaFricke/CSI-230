#!/bin/bash
link="http://10.0.17.6/Assignment.html"

temp=$(curl -sL "$link" | xmlstarlet select --template --value-of "//html//body//table[@id='temp']//tr//td" | awk 'NR % 2 == 1')

press=$(curl -sL "$link" | xmlstarlet select --template --value-of "//html//body//table[@id='press']//tr//td" | awk 'NR % 2 == 1')

date=$(curl -sL "$link" | xmlstarlet select --template --value-of "//html//body//table[@id='temp']//tr//td" | awk 'NR % 2 == 0')

cnt=$(echo "$temp" | wc -l)

for (( i=1; i<$cnt; i++)) 

do 
var1=$(echo "$temp" | head -n $i | tail -n 1)
var2=$(echo "$press" | head -n $i | tail -n 1)
var3=$(echo "$date" | head -n $i | tail -n 1)

echo "$var1 $var2 $var3"

done

