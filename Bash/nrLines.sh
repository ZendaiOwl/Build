#!/usr/bin/env sh
# Can be used to get the number of lines inside a file or multiple files.
# Will display the total number of lines if more than one file is provided. 
# Victor-ray, S. @ZendaiOwl
# https://github.com/ZendaiOwl
getLine() {
	set -euf
	wc -l "$1" | awk '{print $1" lines in "$2}';
	set +euf
}

getLines() {
	set -euf
	wc -l "$@" | awk '{print $1" lines in "$2}';
	set +euf
}

test "$#" -gt 1 && getLines "$@";
test "$#" -eq 1 && getLine "$1";
test "$#" -eq 0 && echo "Usage: nrLines.sh [FILE] (+ [FILE] + [FILE] etc)";

exit 0

