#!/usr/bin/env bash
set -euf -o pipefail
test "$#" -gt 0 \
&& PATTERN="$*"; grep --recursive --exclude-dir '.*' "$PATTERN"
set +euf -o pipefail
exit 0
