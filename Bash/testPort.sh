#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Test if a port is open or closed on a remote host
# Exit codes
# 1: Open
# 2: Closed
# 3: Invalid number of arguments
testRemotePort() {
  local -r HOST="$1" PORT="$2"
  timeout 2.0 bash -c "true 2>/dev/null>/dev/tcp/$HOST/$PORT" && return 0 || return 1
}
if test "$#" -eq 2
then
  if testRemotePort "$1" "$2"
  then
    echo "open" && exit 0
  else
    echo "closed" && exit 1
  fi
else
  printf '%s\n\t%s\n\t%s\n' "Requires 2 arguments" "[HOST]: Can be FQDN, IPv4 or IPv6" "[PORT]: Can be any valid port integer" && exit 2
fi
