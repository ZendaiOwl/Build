#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Checks if a command exists on the system
# Exit status codes
# 0: Command exists on the system
# 1: Command is unavailable on the system
# 2: Missing command argument to check
hasCMD() {
  if test "$#" -eq 1
  then
    local -r CHECK="$1"
    if command -v "$CHECK" &>/dev/null
    then
      echo "Command is available" && exit 0
    else
      echo "Command is unavailable" && exit 1
    fi
  else
    echo "Command as 1 argument required" && exit 2
  fi
}
test "$#" -eq 1 && hasCMD "$1" || hasCMD
