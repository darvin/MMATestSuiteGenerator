#!/bin/sh
set -e
echo "downloading docs from personal online backup"
rm -Rf build_docs/ || true
while read SYMNAME; do
	echo "Downloading $SYMNAME"
	OUTPUT_FILE="build_docs/ReferencePages/Symbols/$SYMNAME.nb"
	if [ ! -f "$OUTPUT_FILE" ]; then
	    mkdir -p "$OUTPUT_FILE"
	    rm -r "$OUTPUT_FILE"
	fi

	wget --quiet --http-user="sergey.v.klimov+mathbackupbox@gmail.com" --http-password="mathematica" -nd -nH  "https://dav.box.com/dav/MMA10DocsBackup/ReferencePages/Symbols/$SYMNAME.nb" -O "$OUTPUT_FILE"

done <WHITELIST


