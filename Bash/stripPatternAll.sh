#!/usr/bin/env bash
function usage() {
	echo "Usage: stripAll [STRING] [PATTERN]"
}
function stripAll() {
	# Strip all instances of pattern from string
	# Usage: strip_all "string" "pattern"
	set -euf -o pipefail
	printf '%s\n' "${1//$2}"
	set +euf -o pipefail
}
test "$#" -eq 2 && stripAll "$1" "$2";
test "$#" -ne 2 && usage;
exit 0

