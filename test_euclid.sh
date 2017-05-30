#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT(){
 echo "$1" >&2
 rm -f $tmp-*
 exit 1
}

#define message
echo "The number of arguments is not two." > $tmp-errmes1
echo "The first argument is not a natural number." > $tmp-errmes2
echo "The second argument is not a natural number." > $tmp-errmes3
echo "10" > $tmp-nummes

#TEST1
./euclid.sh 20 > $tmp-err1 && ERROR_EXIT "TEST1-1"
diff $tmp-errmes1 $tmp-err1 || ERROR_EXIT "TEST1-2"

#TEST2
./euclid.sh 2.1 2 > $tmp-err2 && ERROR_EXIT "TEST2-1"
diff $tmp-errmes2 $tmp-err2 || ERROR_EXIT "TEST2-2"

#TEST3
./euclid.sh 2 2.1 > $tmp-err3 && ERROR_EXIT "TEST3-1"
diff $tmp-errmes3 $tmp-err3 || ERROR_EXIT "TEST3-2"

#TEST4
./euclid.sh 20 10 > $tmp-num || ERROR_EXIT "TEST4-1"
diff $tmp-num $tmp-nummes || ERROR_EXIT "TEST4-2"

echo OK
rm -f $tmp-*
exit 0

