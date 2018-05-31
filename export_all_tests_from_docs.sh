#!/bin/sh

set -e
while read SYMNAME; do
	
	INPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	OUTPUT_FILE="output/Tests/$SYMNAME_Tests.m"
	echo "Generating tests for $SYMNAME"
	wolfram_wrapper -script ./export_tests_from_docs.m $INPUT_FILE $OUTPUT_FILE

done <WHITELIST


