#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Utility Functions
#

# Check if user ID executing script/function is 0 or not
isRoot() {
  test "$EUID" -eq 0 && { echo "Is root" && return 0 || return 1; }
}

# Gets the current time in UNIX & regular time (human-readable format)
getTime() {
  local -r UNIX=$(date +%s)
  local -r REGULAR=$(date -d @"$UNIX")
  printf '%s\n%s\n' "Regular: $REGULAR" "Unix: $UNIX"
  return 0
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
      echo "Command is available" && return 0
    else
      echo "Command is unavailable" && return 1
    fi
  else
    echo "Command as 1 argument required" && return 2
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
      echo "Installed" && return 0
    elif apt-cache show "$CHECK" &>/dev/null
    then
      echo "Not installed, can install" && return 1
    else
      echo "Not installed, install unavailable" && return 2
    fi
  else
    echo "Package as 1 argument required" && return 3
  fi
}

# Shows the number of files in working directory's directory & all its subdirectories excluding hidden directories.
showDirFiles() {
  grep --files-with-matches --recursive --exclude-dir='.*' ''
  return 0
}

# Search for a pattern recursively in files
searchForPattern() {
  PATTERN="$*"; grep --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null && return 0
}

# Search for a files with pattern recursively
getFilesWithPattern() {
  PATTERN="$*"; grep --files-with-matches --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null && return 0
}

genPassword() {
  # This function uses /dev/urandom to generate a password randomly.
  # Default length is 36
  #
  # Ex. This one below uses the most commonly allowed password characters
  # < /dev/urandom tr -dc 'A-Z-a-z-0-9' | head -c${1:-32};echo;
  # 
  # [Patterns]
  # 1: 'A-Z a-z 0-9'
  # 2: 'A-Z a-z 0-9 {[#$@]}'
  # 3: 'A-Z a-z 0-9 {[#$@*-+/]}'
  # 4: 'A-Z a-z 0-9 <{[|?!~$#*-+/]}>'
  # 5: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~=,-]}'
  # 6: A-Za-z0-9'{[|:?!#$@%+*^.~,=()/\\;]}'
  # 7: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~,-()/;]}'
  # 8: 'A-Z a-z0-9{[|:?!#$@%+*^.~,=()/\\;]}'
  # 9: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~,-()/;/=]}'
  # # # # # # # # # # # # # # # # # # # # # # #
  < /dev/urandom tr -dc 'A-Z a-z0-9{[|:?!#$@%+*^.~,=()/\\;]}' | head -c"${1:-36}"; printf '\n' && return 0
}

genOpenSSLPassword() {
  # Generates a password using OpenSSL, default length is 36.
  openssl rand -base64 "${1:-36}" && return 0
}

getScriptPath() {
  test "$#" -eq 1 && {
    PTH=$(type -p "$1"); file "$PTH" && return 0
  } || return 0
}

# Displays 8 × 16-bit ANSI colours
colour() {
  local -r Z='\e[0m' \
           COLOUR=('\e[37m' '\e[36m' '\e[35m' '\e[34m' '\e[33m' '\e[32m' '\e[31m' '\e[30m' '\e[0m') \
           NAME=("WHITE" "CYAN" "PURPLE" "BLUE" "YELLOW" "GREEN" "RED" "BLACK" "RESET")
  for C in {0..8}
  do
    printf "${COLOUR[$C]}%s${Z} \t%s\n" "${NAME[$C]}" "${COLOUR[$C]}"
  done
  return 0
}

# TODO
# Debug log function
# Info log function
# Success log function
# Warning log function
# Error log function
