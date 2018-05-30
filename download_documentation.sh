#!/bin/sh
set -e
echo "downloading docs from personal online backup"
while read SYMNAME; do
	
	OUTPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	if [ ! -f "$OUTPUT_FILE" ]; then
		echo "Downloading $SYMNAME"
	    mkdir -p "$OUTPUT_FILE"
	    rm -r "$OUTPUT_FILE"
	    wget --quiet --http-user="sergey.v.klimov+mathbackupbox@gmail.com" --http-password="mathematica" -nd -nH  "https://dav.box.com/dav/MMA10DocsBackup/ReferencePages/Symbols/$SYMNAME.nb" -O "$OUTPUT_FILE"
	else
		echo "Skipping $SYMNAME"
	fi


done <WHITELIST


