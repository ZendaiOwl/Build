#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
getTime() {
  local -r UNIX=$(date +%s)
  local -r REGULAR=$(date -d @"$UNIX")
  printf '%s\n%s\n' "Regular: $REGULAR" "Unix: $UNIX"
}
getTime
exit 0

