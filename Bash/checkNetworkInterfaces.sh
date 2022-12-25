#!/usr/bin/env sh
set -euf
test "$(id -u)" -eq 0 && lsof -nP -i
test "$(id -u)" -ne 0 && sudo lsof -nP -i
set +euf
exit 0

