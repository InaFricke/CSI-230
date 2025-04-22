#! /bin/bash

pressure=$(curl -sL "$link" | xmlstarlet select --template --value-of
"//html//body//table [@id='press']//tr//td" | awk 'NR % 2 == 1'

temp=$(curl -sL "$link" | xmlscarlet select --template --value-of
"//html//body//table [@id='temp']//tr//td" | awk 'NR % 2 == 1'

date=$(curl -sL "$link" | xmlstarlet select --template --value-of
#//html//body//table [@id='date']//tr//td" | awk 'NR % 2 == 0'

#for loop number of elements

#cnt=$(echo "$pressure" | wc -1)
#for (( i=1; i<="${cnt}"; i++))
#do 
#var1=$(echo pressure head -n $i | tail -n 1)
#var2=$(echo temp head -n $i | tail -n 1)
#var3=$(echo date head -n $i | tail -n 1)

#	echo "$var1 $var2 $var3"
#done
echo $pressure
