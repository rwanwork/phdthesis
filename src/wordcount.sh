#!/bin/bash

START=214
daycount=`date +%j`
daycounter=`expr $daycount + $START`

year=`date +%Y`
month=`date +%m`
day=`date +%d`
hour=`date +%k`
minute=`date +%M`


#date +%j' '%Y' '%m' '%d' '%k':'%M;

cd /home/vice/pmt/rwan/src/thesis/t
wordcount=`find -path './*.tex' -prune -exec wc -w {} \; | awk 'BEGIN {acc = 0} {acc += $1} END {printf "%d", acc}'`
charcount=`find -path './*.tex' -prune -exec wc -c {} \; | awk 'BEGIN {acc = 0} {acc += $1} END {printf "%d", acc}'`

echo -e "$daycounter $year $month $day $hour:$minute $charcount $wordcount"

