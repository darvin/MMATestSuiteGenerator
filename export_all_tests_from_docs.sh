#!/bin/bash

set -e

task(){
	SYMNAME=$1
   	INPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	OUTPUT_FILE="output/Tests/$SYMNAME""_Tests.m"
	echo "Generating tests for $SYMNAME >>> $OUTPUT_FILE"
	wolfram -script ./export_tests_from_docs.m $INPUT_FILE $OUTPUT_FILE
}

export -f task

cat WHITELIST | parallel --no-notice -j4 task 



