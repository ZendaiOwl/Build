#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Test if a port is open or closed on a remote host
# Exit codes
# 1: Open
# 2: Closed
# 3: Invalid number of arguments
testRemotePort() {
  local -r HOST="$1" PORT="$2"
  if timeout 2.0 bash -c "true &>/dev/null>/dev/tcp/$HOST/$PORT"
  then
    echo "open" && return 0
  else
    echo "closed" && return 1
  fi
}
if test "$#" -eq 2
then
  testRemotePort "$1" "$2"
else
  return 2
fi
