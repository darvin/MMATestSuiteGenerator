#!/bin/bash
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
	echo "Generating tests for $SYMNAME >>> $OUTPUT_FILE"
	$MATHEMATICA_RUN_PREFIX wolfram -script ./export_tests_from_docs.m $INPUT_FILE $OUTPUT_FILE
}

export -f task

bash ./cat_portion.sh WHITELIST | parallel --will-cite -j$CORES task 



