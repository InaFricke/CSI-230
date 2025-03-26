#!/bin/bash

file="/var/log/apache2/access.log"

results=$(cat "/var/log/apache2/access.log" | grep "page1.html" | sort -n | uniq -c)

echo "$results"
