#!/usr/bin/env bash
set -euo pipefail

function getArrayLength() {
	if [[ $# -eq 1 ]]; then
		AR="${1}"
		echo "${#AR[@]}";
	else
		echo "1 argument variable: array";
	fi
}

exit 0

