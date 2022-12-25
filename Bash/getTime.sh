#!/usr/bin/env sh
set -euf
UNIX=$(date +%s)
REGULAR=$(date -d @"$UNIX")
printf '%s\n%s\n' "Regular: ${REGULAR}" "Unix: ${UNIX}"
set +euf
exit 0

