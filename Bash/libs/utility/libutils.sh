#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Utility Functions
#

# Check if user ID executing script/function is 0 or not
isRoot() {
  test "$EUID" -eq 0 && { echo "Is root" && exit 0; }
  test "$EUID" -ne 0 && { echo "Not root" && exit 1; }
}

# Gets the current time in UNIX & regular time (human-readable format)
getTime() {
  local -r UNIX=$(date +%s)
  local -r REGULAR=$(date -d @"$UNIX")
  printf '%s\n%s\n' "Regular: $REGULAR" "Unix: $UNIX"
}

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
      echo "Not installed, can install" && exit 1
    else
      echo "Not installed, install unavailable" && exit 2
    fi
  else
    echo "Package as 1 argument required" && exit 3
  fi
}

# Displays 8 × 16-bit ANSI colours
colour() {
  local -r Z='\e[0m' \
           PFX="COLOUR" \
           COLOUR=('\e[37m' '\e[36m' '\e[35m' '\e[34m' '\e[33m' '\e[32m' '\e[31m' '\e[30m' '\e[0m') \
           NAME=("WHITE" "CYAN" "PURPLE" "BLUE" "YELLOW" "GREEN" "RED" "BLACK" "RESET")
  for C in {0..8}
  do
    printf "${COLOUR[$C]}%s${Z} \t%s\n" "${NAME[$C]}" "${COLOUR[$C]}"
  done
  exit 0
}

# TODO
# Debug log function
# Info log function
# Success log function
# Warning log function
# Error log function
