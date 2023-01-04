#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Utility Functions
#

# Check if user ID executing script/function is 0 or not
# Return codes
# 0: Is root
# 1: Not root
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
  local -r REGULAR=$(date -d @"$UNIX") LOCALEDATE=$(date +%x) LOCALETIME=$(date +%X)
  printf '%s\n%s\n%s\n%s\n' "Regular: $REGULAR" "Unix: $UNIX" "Locale's Date: $LOCALEDATE" "Locale's Time: $LOCALETIME"
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
    date +%X
    return 0
  else
    echo "Requires no argument(s)"
    return 1
  fi
}

# Gets the locale's time definition
getLocaleDate() {
  if test "$#" -eq 0
  then
    date +%x
    return 0
  else
    echo "Requires no argument(s)"
    return 1
  fi
}

# Updates a Git repository directory and signs the commit before pushing with a message
updateGit() {
  local DIRECTORY MESSAGE COMMITMESSAGE
  local -r GPG_KEY_ID="E2AC71651803A7F7"
  if [[ "$#" -eq 1 ]] ; then
    DIRECTORY="$PWD"
    MESSAGE="$1"
  elif [[ "$#" -gt 1 ]] ; then
    DIRECTORY="$1"
    MESSAGE="${*:2}"
  fi
  (
    COMMITMESSAGE="࿓❯ $MESSAGE"
    local -r GIT_COMMIT_ARGS=(--signoff --gpg-sign="$GPG_KEY_ID" -m "$COMMITMESSAGE")
    git add "$DIRECTORY"
    git commit "${GIT_COMMIT_ARGS[@]}"
    git push
  )
  return 0
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
      echo "Available"
      return 0
    else
      echo "Unavailable"
      return 1
    fi
  else
    echo "Requires 1 argument: [Command]"
    return 2
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
      echo "Installed"
      return 0
    elif apt-cache show "$CHECK" &>/dev/null
    then
      echo "Not installed, install available"
      return 1
    else
      echo "Not installed, install unavailable"
      return 2
    fi
  else
    echo "Requires 1 argument: [Package]"
    return 3
  fi
}

# Shows the number of files in working directory's directory & all its subdirectories excluding hidden directories.
showDirFiles() {
  if test "$#" -eq 0
  then
    grep --files-with-matches --recursive --exclude-dir='.*' ''
    return 0
  else
    echo "Requires no argument(s)"
    return 1
  fi
}

# Search for pattern in a specific file
findPatternInFile() {
  if test "$#" -eq 2
  then
    local -r PATTERN="$1" FILE="$2"
    grep "$PATTERN" "$FILE"
    return 0
  else
  	echo "Requires 2 argument: [Text pattern to find] [File to search]"
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
    echo "Requires 1 argument or more: [Pattern(s) to locate]"
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
    echo "Requires no argument(s)"
    return 1
  fi
}

# Deletes a specified line in a file
deleteLineInFile() {
  if test "$#" -eq 2
  then
    local -r LINENR="$1" FILE="$2"
    sed -i ''"$LINENR"'d' "$FILE"
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
    sed -i ''"$START"','"$END"'d' "$FILE"
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
    sed -i "s|${FINDTEXT}|${NEWTEXT}|g" "$FILE"
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
    sed -i ''"$LINENR"'a '"$TEXT"'' "$FILE"
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
    sed -i '/'"$PATTERN"'/a '"$TEXT"'' "$FILE"
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
    sed -i '$a '"$TEXT"'' "$FILE"
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
    sed -i ''"$LINENR"'i '"$TEXT"'' "$FILE"
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
    sed -i '/'"$PATTERN"'/i '"$TEXT"'' "$FILE"
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
    sed -i '$i '"$TEXT"'' "$FILE"
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
  # 1: 'A-Za-z0-9'
  # 2: 'A-Za-z0-9{[#$@]}'
  # 3: 'A-Z a-z0-9{[#$@*-+/]}'
  # 4: 'A-Z a-z0-9<{[|?!~$#*-+/]}>'
  # 5: 'A-Z a-z0-9<{[|:?!#$@%+*^.~=,-]}>'
  # 6: 'A-Z a-z0-9<{[|:?!#$@%+*^.~,=()/\\;]}>'
  # 7: 'A-Z a-z0-9<{[|:?!#$@%+*^.~,-()/;]}>'
  # 8: 'A-Z a-z0-9<{[|:?!#$@%+*^.~,=()/\\;]}>'
  # 9: 'A-Z a-z0-9<{[|:?!#$@%+*^.~,-()/;/=]}>'
  # # # # # # # # # # # # # # # # # # # # # # #
  < /dev/urandom tr -dc 'A-Za-z0-9{[#$@]}' | head -c"${1:-36}"; printf '\n'
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
    local -r COMMAND="$1" LOGFILE="logfile.txt"
    if test -f "$LOGFILE"
    then
      echo "$LOGFILE exists, appending to existing file"
      echo "Appending new output from $COMMAND" | tee -a "$LOGFILE"
      bash -c "$COMMAND" | tee -a "$LOGFILE"
      return 0
    else
      touch "$LOGFILE"
      bash -c "$COMMAND" | tee -a "$LOGFILE"
      return 0
    fi
  else
    echo "Requires 1 argument: [Command to record output of]"
    return 1
  fi
}

# A log function that uses log levels for logging different outputs
# Log levels
# -2: Debug
# -1: Info
#  0: Success
#  1: Warning
#  2: Error
log() {
  if test "$#" -gt 0
  then
    local -r LOGLEVEL="$1" TEXT="${*:2}" Z='\e[0m'
    if [[ "$LOGLEVEL" =~ [(-2)-2] ]]
    then
      case "$LOGLEVEL" in
        -2)
          local -r CYAN='\e[1;36m' PFX="DEBUG"
          printf "${CYAN}%s${Z}: %s\n" "$PFX" "$TEXT"
          ;;
        -1)
          local -r BLUE='\e[1;34m' PFX="INFO"
          printf "${BLUE}%s${Z}: %s\n" "$PFX" "$TEXT"
          ;;
        0)
          local -r GREEN='\e[1;32m' PFX="SUCCESS"
          printf "${GREEN}%s${Z}: %s\n" "$PFX" "$TEXT"
          ;;
        1)
          local -r YELLOW='\e[1;33m' PFX="WARNING"
          printf "${YELLOW}%s${Z}: %s\n" "$PFX" "$TEXT"
          ;;
        2)
          local -r RED='\e[1;31m' PFX="ERROR"
          printf "${RED}%s${Z}: %s\n" "$PFX" "$TEXT"
          ;;
      esac
    else
      log 2 "Invalid log level: [Debug: -2|Info: -1|Success: 0|Warning: 1|Error: 2]"
    fi
  fi
}

# Displays 8 × 16-bit ANSI bold colours and a blinking effect
# \e[0;34m = Normal
# \e[1;34m = Bold
# \e[2;34m = Light
# \e[3;34m = Italic
# \e[4;34m = Underlined
# \e[5;34m = Blinking
# \e[6;34m = Blinking
# \e[7;34m = Background/Highlighted
# \e[8;34m = Blank/Removed
# \e[9;34m = Crossed over
# These can be combined, ex.
# \e[1;5;m = Blinking Bold
colour() {
  local -r Z='\e[0m' \
           COLOUR=('\e[1;37m' '\e[1;36m' '\e[1;35m' '\e[1;34m' '\e[1;33m' '\e[1;32m' '\e[1;31m' '\e[1;30m' '\e[5m' '\e[0m') \
           NAME=("WHITE" "CYAN" "PURPLE" "BLUE" "YELLOW" "GREEN" "RED" "BLACK" "BLINK" "RESET")
  local -r LENGTH="${#NAME[@]}"
  for (( C = 0; C < "$LENGTH"; C++ ))
  do
    printf "${COLOUR[$C]}%s${Z} \t%s\n" "${NAME[$C]}" "${COLOUR[$C]}"
  done
}
