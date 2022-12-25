#!/usr/bin/env bash
# Counts the number of files in a directory, or the number of directories
# Usage: count /path/to/dir/*
#        count /path/to/dir/*/
function usage() {
	echo "Usage: 
count /path/to/dir/*
count /path/to/dir/*/
"
}
function count() {
	set -euf -o pipefail
	printf '%s\n' "$#" || printf '%s\n' "0"
	set +euf -o pipefail
}
test -e "$1" && count "$@";
test -z "$1" && usage;
exit 0
