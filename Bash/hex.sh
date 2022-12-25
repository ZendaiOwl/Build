#!/usr/bin/env bash
set -euo pipefail

for i in {1..9}; do
	for x in {'A','B','C','D','E','F'}; do
		OUT+="${i}${x}\n";
	done
done
echo -e ${OUT} | column;
exit 0

