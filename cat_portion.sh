#!/bin/bash
if [ -z ${PORTION_COUNT+x} ]; then 
	PORTION_COUNT=1
	PORTION_INDEX=1
fi

a=($(wc  $1))
lines=$((${a[0]} + 1))
words=${a[1]}
chars=${a[2]}


function ceiling {
    DIVIDEND=${1}
    DIVISOR=${2}
    if [ $(( DIVIDEND % DIVISOR )) -gt 0 ]; then
            RESULT=$(( ( ( $DIVIDEND - ( $DIVIDEND % $DIVISOR ) ) / $DIVISOR ) + 1 ))
    else
            RESULT=$(( $DIVIDEND / $DIVISOR ))
    fi
    echo $RESULT
}


linesPerPortion=$(ceiling lines PORTION_COUNT)
beginLine=$((linesPerPortion * (PORTION_INDEX-1) +1))
endLine=$((linesPerPortion * (PORTION_INDEX) ))
sed -n "$beginLine","$endLine"p $1
