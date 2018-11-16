#!/bin/sh
for LINE in `cat $1`
do
   nslookup $LINE | grep -e 'Address: [0-9]' | sed 's/Address: //g' | sort -u
done