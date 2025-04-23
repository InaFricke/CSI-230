#!bin/bash

# run ip addr
i=$(ip addr | grep "inet" | \
grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | head -2 |tail -1)
echo $i
