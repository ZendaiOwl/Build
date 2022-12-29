#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
# Gets the listening ports on the system
set -euf -o pipefail
test "$EUID" -ne 0 && grep 'LISTEN' <(sudo lsof -i -P -n)
test "$EUID" -eq 0 && grep 'LISTEN' <(lsof -i -P -n)
set +euf -o pipefail
exit 0
