#!/bin/bash
set -Ee

PATH=$(npm bin):$PATH

files=("$@")
if ((${#files[@]} == 0)); then
	echo "files not found"
  	exit 3
fi

echo "TAP version 13"

arraylength=${#files[@]}


for (( i=1; i<${arraylength}+1; i++ ));
do
	file=${files[$i-1]}

	test -e ${file} || exit
 
	duh 'text => { 
	var isBroken = text.match(/^not\ ok/m); 
	var hasPassed = text.match(/^ok/m); 
	return "# Subtest: '"$file"'\n"+
		(text.match(/^not\ ok.*$/gm) || []).map(line => "    "+line+"\n").join("")+ 
		(isBroken||!hasPassed?"not ok":"ok") +
			" '"$i"' - '"$file"' \n" }' < $file 
	
done

echo "1..$arraylength"