#!/bin/bash

INPUTFILE=$1

OUTPUTFILE="data/output.txt"

if [ -e "$OUTPUTFILE" ]; then
	#exists
	rm "$OUTPUTFILE"
fi

while read p; do
	./scrape.sh "$p" >> "$OUTPUTFILE"
done <"$INPUTFILE"
