#!/usr/bin/env bash 
# This script adds a directory or file to the .gitignore 
# file in my local .dotz directory.
set -euo pipefail
PATHWAY=$1
test -e $PATHWAY && {
echo "$PATHWAY" >> /home/zendai/.dotz/.gitignore
}
set +euo pipefail
exit 0
