#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT(){
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

echo "same2.sh requires 2 string inputs" > $tmp-ans
./same2.sh 2> $tmp-err && ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-err && ERROR_EXIT "TEST2-2"

echo OK
rm -f $tmp-*
exit 0
