#!/bin/sh


# number of argument check
if [ $# -ne 2 ]; then
	echo "The number of arguments is not two."
	exit 1
fi

# natural number check
Arg1=`echo -n $1 | sed 's/[0-9]//g'`
if [ -n "$Arg1" ]; then
	echo "The first argument is not a natural number."
	exit 2
fi

Arg2=`echo -n $2 | sed 's/[0-9]//g'`
if [ -n "$Arg2" ]; then
	echo "The second argument is not a natural number."
	exit 3
fi

# define number
if [ "$1" -gt "$2" ]; then
	Num1=$1 Num2=$2
else
	Num1=$2 Num2=$1
fi

# main
while [ $Num2 -gt 0 ]
do
	Rem=$(( Num1 % Num2 ))
	Num1=$Num2
	Num2=$Rem
done

echo  $Num1
