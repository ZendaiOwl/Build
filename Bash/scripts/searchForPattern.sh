#!/usr/bin/env bash
test "$#" -gt 0 && {
  PATTERN="$*"
  grep --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null && exit 0
}
