#!/bin/bash

if [ -z ${CORES+x} ]; then 
	CORES=+0
fi

set -e
PATH=$(npm bin):$PATH

concatTaps=`pwd`/concatTaps.sh

processFile () {
	FILE=$1
	BASENAME=`basename $FILE`
	JSON="$BASENAME.json"
	echo "   > $FILE"
	cat $FILE |  tap-mochawesome-reporter > $JSON
	marge -t $BASENAME -p $BASENAME  --reportDir ./ --showSkipped false --showHooks never --showPending false --showPassed false $JSON

}

export -f processFile


spinner()
{
    local pid=$!
    local delay=10.75
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

processDirectory () {
	DIR=$1
	SYSTEM_NAME=`basename $DIR`
	echo "> $SYSTEM_NAME"
	pushd $DIR
	( $concatTaps *.tap | tap-mochawesome-reporter > index.json ) &
	spinner
	marge -t $SYSTEM_NAME -p $SYSTEM_NAME  --reportDir ./ --showSkipped false --showHooks never --showPending false --showPassed false index.json


	ls *.tap | parallel --will-cite -j$CORES processFile

	popd
}

for d in output/Results/*/ ; do
    processDirectory $d
done

processDirectory output/Tests/GenerationLogs

touch output/.nojekyll

./website/generate.js
