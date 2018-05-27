#!/bin/sh
set -ex
echo "hi"
while read SYMNAME; do
	echo "Downloading $SYMNAME"
	OUTPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	if [ ! -f "$OUTPUT_FILE" ]; then
	    mkdir -p "$OUTPUT_FILE"
	    rm -r "$OUTPUT_FILE"
	fi

	wget --http-user="sergey.v.klimov+mathbackupbox@gmail.com" --http-password="mathematica" -nd -nH  "https://dav.box.com/dav/ReferencePages/Symbols/$SYMNAME.nb" -O "$OUTPUT_FILE"

done <WHITELIST


