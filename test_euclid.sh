#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT(){
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

echo "same2.sh requires 2 string inputs" > $tmp-errmes1
echo "same2.sh requires 2 string inputs" > $tmp-errmes2
echo "same2.sh requires 2 string inputs" > $tmp-errmes3
./euclid.sh 20> $tmp-err1 && ERROR_EXIT "TEST2-1"
./euclid.sh 2.1 2> $tmp-err2 && ERROR_EXIT "TEST2-1"
./euclid.sh 2 2.1> $tmp-err3 && ERROR_EXIT "TEST2-1"
diff $tmp-errmes1 $tmp-err1 || ERROR_EXIT "TEST2-2"
diff $tmp-errmes2 $tmp-err2 || ERROR_EXIT "TEST2-2"
diff $tmp-errmes3 $tmp-err3 || ERROR_EXIT "TEST2-2"

echo OK
rm -f $tmp-*

./euclid.sh 20 10
