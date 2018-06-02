#!/bin/bash
set -e
# marge --reportDir ./ --showSkipped false --showHooks never --showPending false --showPassed false 

marge=`pwd`/node_modules/.bin/marge
concatTaps=`pwd`/node_modules/tap-mochawesome-reporter/concatTaps.sh
tapMochawesome=`pwd`/node_modules/.bin/tap-mochawesome-reporter
MAX_MEM=8192
processFile () {
	FILE=$1
	BASENAME=`basename $FILE`
	JSON="$BASENAME.json"
	echo "   > $FILE"
	cat $FILE |  $tapMochawesome > $JSON
	$marge -t $BASENAME -p $BASENAME  --reportDir ./ --showSkipped false --showHooks never --showPending false --showPassed false $JSON

}

processDirectory () {
	DIR=$1
	SYSTEM_NAME=`basename $DIR`
	echo "> $SYSTEM_NAME"
	pushd $DIR
	# $concatTaps *.tap | node --max-old-space-size=$MAX_MEM $tapMochawesome > ALL_TESTS.json
	# node --max-old-space-size=$MAX_MEM $marge -t $SYSTEM_NAME -p $SYSTEM_NAME  --reportDir ./ --showSkipped false --showHooks never --showPending false --showPassed false ALL_TESTS.json

	for f in *.tap ; do
	    processFile $f
	done


	popd
}

for d in output/Results/*/ ; do
    processDirectory $d
done

touch output/.nojekyll

./website/generate.js