#!/bin/bash
TIMEOUT=7m
if [ -z ${CORES+x} ]; then 
	CORES=+0
fi

if [ -z ${DOC_PATH+x} ]; then 
	DOC_PATH=build_docs
fi

set -e
export SHELL=$(type -p bash)

task(){
	SYMNAME=$1
   	INPUT_FILE="$DOC_PATH/ReferencePages/Symbols/$SYMNAME.nb"
	OUTPUT_FILE="output/Tests/$SYMNAME""_Tests.m"
	TAP_FILE="output/Tests/GenerationLogs/$SYMNAME""_Tests.m.gen.tap"
	echo "Generating tests for $SYMNAME >>> $OUTPUT_FILE"
	$MATHEMATICA_RUN_PREFIX wolfram -script ./export_tests_from_docs.m $INPUT_FILE $OUTPUT_FILE |  ./prepend_tap_comment_to_warnings.sh  > $TAP_FILE
}

export -f task

mkdir -p output/Tests/GenerationLogs || true

bash ./cat_portion.sh WHITELIST | parallel --timeout $TIMEOUT --will-cite -j$CORES task 


