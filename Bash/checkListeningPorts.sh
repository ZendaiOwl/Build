#!/usr/bin/env bash
set -euf -o pipefail

grep 'LISTEN' <(sudo lsof -i -P -n)

set +euf -o pipefail

exit 0

