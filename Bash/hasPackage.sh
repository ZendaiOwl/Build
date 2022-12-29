#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Checks if a package exists on the system
# Exit status codes
# 0: Package is installed
# 1: Package is not installed but is available in apt
# 2: Package is not installed and is not available in apt
# 3: Missing package argument to check
hasPKG() {
  if test "$#" -eq 1
  then
    local -r CHECK="$1"
    if dpkg-query -s "$CHECK" &>/dev/null
    then
      echo "Installed" && exit 0
    elif apt-cache show "$CHECK" &>/dev/null
    then
      echo "Not installed, install available" && exit 1
    else
      echo "Not installed, install unavailable" && exit 2
    fi
  else
    echo "Package as 1 argument required" && exit 3
  fi
}
test "$#" -eq 1 && hasPKG "$1" || testPKG
