#! /bin/bash
alogs="/home/champuser/SYS320-01/Final/access.log"
IOC="/home/champuser/SYS320-01/Final/IOC.txt"

function readfile(){
cat "$alogs" | grep -i -f "$IOC" | cut -d ' ' -f1,4,7 | sed 's/\[//g' | sort -n | uniq  > report.txt
}
readfile

echo "Complete please see report.txt"


