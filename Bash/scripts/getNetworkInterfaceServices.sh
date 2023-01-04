#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
set -euf
test "$EUID" -eq 0 && lsof -nP -i
test "$EUID" -ne 0 && sudo lsof -nP -i
set +euf
exit 0

