#!/usr/bin/env bash
# Strip first occurrence of pattern from string
function usage() {
	echo "Usage: strip [STRING] [PATTERN]"
}
function strip() {
    # Usage: strip "string" "pattern"
    set -euf -o pipefail
    printf '%s\n' "${1/$2}"
    set +euf -o pipefail
}
test "$#" -eq 2 && strip "$1" "$2";
test "$#" -ne 2 && usage;
exit 0

