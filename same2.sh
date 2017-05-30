#!/bin/sh

#arg
if [ $# -lt 1 ]; then
 echo "same2.sh requires 2 string inputs" 1>&2
 exit 1
fi

if [ $1 = $2 ]; then
 echo "$1 $2 OK"
else
 echo "$1 $2 NG"
fi
