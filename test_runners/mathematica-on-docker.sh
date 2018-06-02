#!/bin/bash
if [ -z ${CORES+x} ]; then 
	CORES=+0
fi

set -e
export SHELL=$(type -p bash)

task(){
	SYMNAME=$1
	TEST_FILE="output/Tests/$SYMNAME""_Tests.m"
	echo "Running test file $TEST_FILE"
	$MATHEMATICA_RUN_PREFIX wolfram -script $TEST_FILE
}

export -f task

bash ./cat_portion.sh WHITELIST | parallel --will-cite -j$CORES task 
