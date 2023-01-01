#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Utility Functions
#

# Check if user ID executing script/function is 0 or not
isRoot() {
  if test "$EUID" -eq 0
  then
    echo "Is root"
    return 0
  else
    echo "Not root"
    return 1
  fi
}

# Gets the current time in UNIX & regular time (human-readable format)
getTime() {
  local -r UNIX=$(date +%s)
  local -r REGULAR=$(date -d @"$UNIX")
  printf '%s\n%s\n' "Regular: $REGULAR" "Unix: $UNIX"
  return 0
}

# Converts UNIX timestamps to regular human-readable timestamp
unixTimeToRegular() {
  if test "$#" -eq 1
  then
    local -r UNIXTIME="$1"
    local -r REGULAR=$(date -d @"$UNIXTIME")
    printf '%s\n' "$REGULAR"
    return 0
  else
    echo "Requires 1 argument: [UNIX Timestamp]"
    return 1
  fi
}

# Gets the locale's date definition
getLocaleTime() {
  if test "$#" -eq 0
  then
    date +%x
    return 0
  else
    echo "Requires no arguments"
    return 1
  fi
}

# Gets the locale's time definition
getLocaleDate() {
  if test "$#" -eq 0
  then
    date +%X
    return 0
  else
    echo "Requires no arguments"
    return 1
  fi
}


# Checks if a command exists on the system
# Return status codes
# 0: Command exists on the system
# 1: Command is unavailable on the system
# 2: Missing command argument to check
hasCMD() {
  if test "$#" -eq 1
  then
    local -r CHECK="$1"
    if command -v "$CHECK" &>/dev/null
    then
      echo "Available" && return 0
    else
      echo "Unavailable" && return 1
    fi
  else
    echo "Requires 1 argument: [Command]" && return 2
  fi
}

# Checks if a package exists on the system
# Return status codes
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
      echo "Not installed, install available" && return 1
    else
      echo "Not installed, install unavailable" && return 2
    fi
  else
    echo "Package as 1 argument required" && return 3
  fi
}

# Shows the number of files in working directory's directory & all its subdirectories excluding hidden directories.
showDirFiles() {
  if test "$#" -eq 0
  then
    grep --files-with-matches --recursive --exclude-dir='.*' ''
    return 0
  else
    echo "Requires no arguments"
    return 1
  fi
}

# Search for a pattern recursively in files
searchForPattern() {
  if test "$#" -gt 0
  then
    local -r PATTERN="$*"
    grep --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null
    return 0
  else
    echo "Requires minimum 1 argument and up: [Pattern to locate]"
    return 1
  fi
}

# Search for a files with pattern recursively
getFilesWithPattern() {
  if test "$#" -gt 0
  then
    local -r PATTERN="$*"
    grep --files-with-matches --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null
    return 0
  else
    echo "Requires minimum 1 argument and up: [Pattern to locate]"
    return 1
  fi
}

# Counts the number of files recursively from current working directory
countDireFiles() {
  if test "$#" -eq 0
  then
    grep --recursive --files-with-matches --exclude-dir='.*' '' | wc -l
    return 0
  else
    echo "Requires no arguments"
    return 1
  fi
}

# Deletes a specified line in a file
deleteLineInFile() {
  if test "$#" -eq 2
  then
    local -r LINENR="$1" FILE="$2"
    sed ''"$LINENR"'d' "$FILE"
    return 0
  else
    echo "Requires 2 arguments: [Line number] [File]"
    return 1
  fi
}

# Deletes a specified range in a file
deleteRangeInFile() {
  if test "$#" -eq 3
  then
    local -r START="$1" END="$2" FILE="$3"
    sed ''"$START"','"$END"'d' "$FILE"
  else
    echo "Requires 3 arguments: [Start of range] [End of range] [File]"
    return 1
  fi
}

# Replaces a text pattern in a file with new text
replaceTextInFile() {
  if test "$#" -eq 3
  then
    local -r FINDTEXT="$1" NEWTEXT="$2" FILE="$3"
    sed "s|${FINDTEXT}|${NEWTEXT}|g" "$FILE"
    return 0
  else
    echo "Requires 3 arguments: [Text to replace] [New text] [File]"
    return 1
  fi
}

# Appends text after line number
appendTextAtLine() {
  if test "$#" -eq 3
  then
    local -r LINENR="$1" TEXT="$2" FILE="$3"
    sed ''"$LINENR"'a '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 3 arguments: [Line number] [Text to append] [File]"
    return 1
  fi
}

# Appends text after matching text pattern
appendTextAtPattern() {
  if test "$#" -eq 3
  then
    local -r PATTERN="$1" TEXT="$2" FILE="$3"
    sed '/'"$PATTERN"'/a '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 3 arguments: [Text pattern] [Text to append] [File]"
    return 1
  fi
}

# Appends text after the last line
appendTextAtLastLine() {
  if test "$#" -eq 2
  then
    local -r TEXT="$1" FILE="$2"
    sed '$a '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 2 arguments: [Text to append] [File]"
    return 1
  fi
}

# Insert text before line number
insertTextAtLine() {
  if test "$#" -eq 3
  then
    local -r LINENR="$1" TEXT="$2" FILE="$3"
    sed ''"$LINENR"'i '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 3 arguments: [Line number] [Text to insert] [File]"
    return 1
  fi
}

# Insert text before matching text pattern
insertTextAtPattern() {
  if test "$#" -eq 3
  then
    local -r PATTERN="$1" TEXT="$2" FILE="$3"
    sed '/'"$PATTERN"'/i '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 3 arguments: [Text pattern] [Text to insert] [File]"
    return 1
  fi
}

# Inserts text before the last line
insertTextAtLastLine() {
  if test "$#" -eq 2
  then
    local -r TEXT="$1" FILE="$2"
    sed '$i '"$TEXT"'' "$FILE"
    return 0
  else
    echo "Requires 2 arguments: [Text to insert] [File]"
    return 1
  fi
}

# Gets the length of an array
arrayLength() {
  if test "$#" -eq 1
  then
    local -r ARR="$1"
    echo "${#ARR[@]}"
    return 0
  else
    echo "Requires 1 argument: [Array]"
    return 1
  fi
}

# This function uses /dev/urandom to generate a password randomly.
# Default length is 36
genPassword() {
  # Ex. This one below uses the most commonly allowed password characters
  # < /dev/urandom tr -dc 'A-Z-a-z-0-9' | head -c${1:-32};echo;
  # 
  # Patterns ex.
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
  #< /dev/urandom tr -dc 'A-Z a-z0-9{[|:?!#$@%+*^.~,=()/\\;]}' | head -c"${1:-36}"; printf '\n';
  < /dev/urandom tr -dc 'A-Za-z0-9{[#$@]}' | head -c"${1:-36}"; printf '\n'
  return 0
}

# Generates a password using OpenSSL, default length is 36.
genOpenSSLPassword() {
  if hasCMD openssl &> /dev/null
  then
    openssl rand -base64 "${1:-36}"
    return 0
  else
    echo "OpenSSL command not available"
    return 1
  fi
}

# Gets the PATH for a script file
getScriptPath() {
  test "$#" -eq 1 && {
    PTH=$(type -p "$1")
    file "$PTH"
    return 0
  }
}

# Records the output of a command to a file.
recordCommandOutput() {
  if test "$#" -eq 1
  then
    local -r COMMAND="$1" LOGFILE="log.txt"
    touch "$LOGFILE"
    bash -c "$COMMAND" | tee -a "$LOGFILE"
    return 0
  else
    echo "Reuires 1 argument: [Command to record output of]"
    return 1
  fi
}

# TODO
# Debug log function
# Info log function
# Success log function
# Warning log function
# Error log function

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
