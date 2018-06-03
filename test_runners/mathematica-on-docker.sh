#!/bin/bash
TIMEOUT=500
if [ -z ${CORES+x} ]; then 
	CORES=+0
fi

set -e
export SHELL=$(type -p bash)


export OUTPUT_DIR=output/Results/Mathematica_10
mkdir -p $OUTPUT_DIR || true

task(){
	SYMNAME=$1
	TEST_FILE="output/Tests/$SYMNAME""_Tests.m"
	TAP_FILE="$OUTPUT_DIR/$SYMNAME""_Tests.tap"
	echo "Running test file $TEST_FILE"
	$MATHEMATICA_RUN_PREFIX wolfram -script $TEST_FILE |  ./prepend_tap_comment_to_warnings.sh > $TAP_FILE
}

export -f task

bash ./cat_portion.sh WHITELIST | parallel --timeout $TIMEOUT --will-cite -j$CORES task 
