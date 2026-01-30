#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Two arguments (method and filename) are required."
  echo "method = 1 will call Pre-Pair and Re-Pair with the filename."
  exit 1
fi

tempfile=chidori
method=$1
infile=$2
noflag=tempfile.ws.seq.noflag

if [ $method -eq 1 ]; then
  prepair -i $tempfile -e -c -s <$infile
  repair -i $tempfile.ws -t 4 -v 2 -w -f 0
fi

remove-flag <$tempfile.ws.seq >$noflag
review -f $tempfile.ws.wl -l 16 <$noflag >$tempfile.ws.seq.review

huffblocks -e -m $tempfile.cfm.map <$tempfile.cfm >$tempfile.cfm.ih
huffblocks -e -m $tempfile.sm.map <$tempfile.sm >$tempfile.sm.ih
huffblocks -e -m $tempfile.nws.map <$tempfile.nws >$tempfile.nws.ih

