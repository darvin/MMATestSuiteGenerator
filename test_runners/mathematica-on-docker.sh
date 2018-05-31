#!/bin/sh

set -e
while read SYMNAME; do
	
	TEST_FILE="output/Tests/$SYMNAME""_Tests.m"
	echo "Running test file $TEST_FILE"
	wolfram -script $TEST_FILE 

done <WHITELIST


