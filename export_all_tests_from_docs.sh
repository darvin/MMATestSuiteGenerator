#!/bin/bash

set -e
export SHELL=$(type -p bash)

task(){
	SYMNAME=$1
   	INPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	OUTPUT_FILE="output/Tests/$SYMNAME""_Tests.m"
	echo "Generating tests for $SYMNAME >>> $OUTPUT_FILE"
	$MATHEMATICA_RUN_PREFIX wolfram -script ./export_tests_from_docs.m $INPUT_FILE $OUTPUT_FILE
}

export -f task

cat WHITELIST | parallel --will-cite -j2 task 



