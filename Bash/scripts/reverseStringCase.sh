#!/usr/bin/env bash
function usage() {
	echo "Usage: reverseString [STRING]"
}
function reverseString() {
	set -euf -o pipefail
	printf '%s\n' "${1~~}"
	set +euf -o pipefail
}
test "$#" -eq 1 && reverseString "$1";
test "$#" -ne 1 && usage;
exit 0

