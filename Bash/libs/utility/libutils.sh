#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Utility Functions
#

# Check if user ID executing script/function is 0 or not
isRoot() {
  if [[ "$EUID" -eq 0 ]]
  then
    log -1 "Is root"
    return 0
  else
    log -1 "Not root"
    return 1
  fi
}

# Checks if an argument parameter variable is an array or not
isArray() {
  if ! [[ "$#" -eq 1 ]]
  then
    log 2 "Requires 1 argument: [The variable to check if it's an array or not]"
    return 2
  elif ! declare -a "$1" &>/dev/null
  then
    log -1 "Not an array: $1"
    return 1
  else
    log -1 "Is an array: $1"
    return 0
  fi
}

# Gets the current time in UNIX & regular time (human-readable format)
getTime() {
  local -r UNIX=$(date +%s)
  local -r REGULAR=$(date -d @"$UNIX") LOCALEDATE=$(date +%x) LOCALETIME=$(date +%X)
  printf 'Regular: %s\nUnix: %s\nLocale´s Date: %s\nLocale´s Time: %s\n' "$REGULAR" "$UNIX" "$LOCALEDATE" "$LOCALETIME"
}

# Converts UNIX timestamps to regular human-readable timestamp
unixTimeToRegular() {
  if [[ "$#" -eq 1 ]]
  then
    local -r UNIXTIME="$1"
    local -r REGULAR=$(date -d @"$UNIXTIME")
    printf '%s\n' "$REGULAR"
    return 0
  else
    log 2 "Requires 1 argument: [UNIX Timestamp]"
    return 1
  fi
}

# Gets the locale's date definition
getLocaleTime() {
  if [[ "$#" -eq 0 ]]
  then
    date +%X
    return 0
  else
    log 2 "Requires no arguments"
    return 1
  fi
}

# Gets the locale's time definition
getLocaleDate() {
  if [[ "$#" -eq 0 ]]
  then
    date +%x
    return 0
  else
    log 2 "Requires no arguments"
    return 1
  fi
}

# Updates a Git repository directory and signs the commit before pushing with a message
updateGit() {
  local DIRECTORY MESSAGE COMMITMESSAGE
  local -r GPG_KEY_ID="<GPG Key ID>"
  if [[ "$#" -eq 1 ]] ; then
    DIRECTORY="$PWD"
    MESSAGE="$1"
  elif [[ "$#" -gt 1 ]] ; then
    DIRECTORY="$1"
    MESSAGE="${*:2}"
  fi
  (
    COMMITMESSAGE="࿓❯ $MESSAGE"
    local -r GIT_COMMIT_ARGS=(--signoff --gpg-sign="$GPG_KEY_ID" --message="$COMMITMESSAGE")
    git add "$DIRECTORY"
    git commit "${GIT_COMMIT_ARGS[@]}"
    git push
  )
}

# Checks if a command exists on the system
# Return status codes
# 0: Command exists on the system
# 1: Command is unavailable on the system
# 2: Missing command argument to check
hasCMD() {
  if [[ "$#" -eq 1 ]]
  then
    local -r CHECK="$1"
    if command -v "$CHECK" &>/dev/null
    then
      log -1 "Available"
      return 0
    else
      log -1 "Unavailable"
      return 1
    fi
  else
    log 2 "Requires 1 argument: [Command]"
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
  if [[ "$#" -eq 1 ]]
  then
    local -r CHECK="$1"
    if dpkg-query --status "$CHECK" &>/dev/null
    then
      log -1 "Installed"
      return 0
    elif apt-cache show "$CHECK" &>/dev/null
    then
      log -1 "Not installed, install available"
      return 1
    else
      log -1 "Not installed, install unavailable"
      return 2
    fi
  else
    log 2 "Requires 1 argument: [Package name]"
    return 3
  fi
}

# Installs a single package using the package manager and pre-configured options
# Return codes
# 1: Missing package argument
# 0: Install completed
installPKG() {
  if [[ ! "$#" -eq 1 ]]
  then
    log 2 "Requires 1 argument: [PKG to install]"
    return 1
  else
    local -r PKG="$1" OPTIONS='--quiet --assume-yes --no-show-upgraded --auto-remove=true --no-install-recommends'
    local -r SUDOUPDATE="sudo apt-get $OPTIONS update" SUDOINSTALL="sudo apt-get $OPTIONS install" \
             ROOTUPDATE="apt-get $OPTIONS update" ROOTINSTALL="apt-get $OPTIONS install"
    if [[ ! "$EUID" -eq 0 ]]
    then
      # Do not double-quote $SUDOUPDATE
      $SUDOUPDATE &>/dev/null
      log -1 "Installing $PKG"
      # Do not double-quote $SUDOINSTALL
      $SUDOINSTALL "$PKG"
      log 0 "Installed $PKG"
      return 0
    else
      # Do not double-quote $ROOTUPDATE
      $ROOTUPDATE &>/dev/null
      log -1 "Installing $PKG"
      # Do not double-quote $ROOTINSTALL
      $ROOTINSTALL "$PKG"
      log 0 "Installed $PKG"
      return 0
    fi
  fi
}

# Installs multiple packages using the package manager and pre-configured options
# Return codes
# 1: Missing package arguments
# 0: Install completed
installPackages() {
  if [[ "$#" -eq 0 ]]
  then
    log 2 "Requires argument(s): [Package(s) to install]"
    return 1
  else
  local -r PACKAGES="$*" OPTIONS='--quiet --assume-yes --no-show-upgraded --auto-remove=true --no-install-recommends'
  local -r SUDOUPDATE="sudo apt-get $OPTIONS update" SUDOINSTALL="sudo apt-get $OPTIONS install" \
           ROOTUPDATE="apt-get $OPTIONS update" ROOTINSTALL="apt-get $OPTIONS install"
    if [[ ! "$EUID" -eq 0 ]]
    then
      # Do not double-quote $SUDOUPDATE
      $SUDOUPDATE &>/dev/null
      log -1 "Installing $PACKAGES"
      # Do not double-quote $SUDOINSTALL
      $SUDOINSTALL "$PACKAGES"
      log 0 "Installed $PACKAGES"
      return 0
    else
      # Do not double-quote $ROOTUPDATE
      $ROOTUPDATE &>/dev/null
      log -1 "Installing $PACKAGES"
      # Do not double-quote $ROOTINSTALL
      $ROOTINSTALL "$PACKAGES"
      log 0 "Installed $PACKAGES"
      return 0
    fi
  fi
}

# Uses $(<) to read a file to STDOUT, supposedly faster than cat.
readFile() {
  if [[ "$#" -eq 1 ]]
  then
    if [[ -f "$1" ]]
    then
      printf '%s\n' "$(<"$1")"
    else
      printf '%s\n' "Not a file"
    fi
  fi
}

# Shows the files in the current working directory's directory & all its sub-directories excluding hidden directories.
showDirFiles() {
  if [[ "$#" -eq 0 ]]
  then
    grep --files-with-matches --recursive --exclude-dir='.*' ''
    return 0
  else
    log 2 "Requires no arguments"
    return 1
  fi
}

# Counts the number of files recursively from current working directory
countDirFiles() {
  if [[ "$#" -eq 0 ]]
  then
    grep --recursive --files-with-matches --exclude-dir='.*' '' | wc -l
    return 0
  else
    log 2 "Requires no arguments"
    return 1
  fi
}

# Search for pattern in a specific file
findPatternInFile() {
  if ! [[ "$#" -eq 2 ]]
  then
    log 2 "Requires 2 argument: [Text pattern to find] [File to search]"
    return 2
  elif ! [[ -f "$2" ]]
  then
    log 2 "Not a file: $2"
    return 1
  else
    local -r PATTERN="$1" FILE="$2"
    grep "$PATTERN" "$FILE"
    return 0
  fi
}

# Search for a pattern recursively in files of current directory and its sub-directories
searchForPattern() {
  if [[ "$#" -gt 0 ]]
  then
    local -r PATTERN="$*"
    grep --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null
    return 0
  else
    log 2 "Requires minimum 1 argument and up: [Pattern(s) to locate]"
    return 1
  fi
}

# Search for files with pattern(s) recursively
getFilesWithPattern() {
  if [[ "$#" -gt 0 ]]
  then
    local -r PATTERN="$*"
    grep --files-with-matches --recursive --exclude-dir '.*' "$PATTERN" 2>/dev/null
    return 0
  else
    log 2 "Requires minimum 1 argument and up: [Pattern(s) to locate]"
    return 1
  fi
}

# Deletes a specified line in a file
deleteLineInFile() {
  if ! [[ "$#" -eq 2 ]]
  then
    log 2 "Requires 2 arguments: [Line number] [File]"
    return 3
  elif ! [[ "$1" =~ [0-9*] ]]
  then
    log 2 "Not a positive integer digit: $1"
    return 2
  elif ! [[ -f "$2" ]]
  then
    log 2 "Not a file: $2"
    return 1
  else
    local -r LINENR="$1" FILE="$2"
    sed -i ''"$LINENR"'d' "$FILE"
    return 0
  fi
}

# Deletes a specified range in a file
deleteRangeInFile() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Start of range] [End of range] [File]"
    return 3
  elif ! [[ "$1" =~ [0-9*] && "$2" =~ [0-9*] ]]
  then
    log 2 "Not a positive integer digit range: $1 & $2"
    return 1
  elif ! [[ -f "$3" ]]
  then
    log 2 "Not a file: $3"
    return 2
  else
    local -r START="$1" END="$2" FILE="$3"
    sed -i ''"$START"','"$END"'d' "$FILE"
    return 0
  fi
}

# Replaces a text pattern in a file with new text
replaceTextInFile() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Text to replace] [New text] [File]"
    return 2
  elif ! [[ -f "$3" ]]
  then
    log 2 "Not a file: $3"
    return 1
  else
    local -r FINDTEXT="$1" NEWTEXT="$2" FILE="$3"
    sed -i "s|${FINDTEXT}|${NEWTEXT}|g" "$FILE"
    return 0
  fi
}

# Appends text after line number
appendTextAtLine() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Line number] [Text to append] [File]"
    return 3
  elif ! [[ -f "$3" ]]
  then
    log 2 "Not a file: $3"
    return 2
  elif ! [[ "$1" =~ [0-9*] ]]
  then
    log 2 "Not a positive integer digit: $1"
    return 1
  else
    local -r LINENR="$1" TEXT="$2" FILE="$3"
    sed -i ''"$LINENR"'a '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Appends text after matching text pattern
appendTextAtPattern() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Text pattern] [Text to append] [File]"
    return 2
  elif ! [[ -f "$3" ]]
  then
  	log 2 "Not a file: $3"
  	return 1
  else
    local -r PATTERN="$1" TEXT="$2" FILE="$3"
    sed -i '/'"$PATTERN"'/a '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Appends text after the last line
appendTextAtLastLine() {
  if ! [[ "$#" -eq 2 ]]
  then
    log 2 "Requires 2 arguments: [Text to append] [File]"
    return 2
  elif ! [[ -f "$2" ]]
  then
    log 2 "Not a file: $2"
    return 1
  else
    local -r TEXT="$1" FILE="$2"
    sed -i '$a '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Insert text before line number
insertTextAtLine() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Line number] [Text to insert] [File]"
    return 2
  elif ! [[ -f "$3" ]]
  then
    log 2 "Not a file: $3"
    return 1
  else
    local -r LINENR="$1" TEXT="$2" FILE="$3"
    sed -i ''"$LINENR"'i '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Insert text before matching text pattern
insertTextAtPattern() {
  if ! [[ "$#" -eq 3 ]]
  then
    log 2 "Requires 3 arguments: [Text pattern] [Text to insert] [File]"
    return 2
  elif ! [[ -f "$3" ]]
  then
    log 2 "Not a file: $3"
    return 1
  else
    local -r PATTERN="$1" TEXT="$2" FILE="$3"
    sed -i '/'"$PATTERN"'/i '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Inserts text before the last line
insertTextAtLastLine() {
  if ! [[ "$#" -eq 2 ]]
  then
    log 2 "Requires 2 arguments: [Text to insert] [File]"
    return 2
  elif ! [[ -f "$2" ]]
  then
    log 2 "Not a file: $2"
    return 1
  else
    local -r TEXT="$1" FILE="$2"
    sed -i '$i '"$TEXT"'' "$FILE"
    return 0
  fi
}

# Gets the length of an array
arrayLength() {
  if ! [[ "$#" -eq 1 ]]
  then
    log 2 "Requires 1 argument: [Array]"
    return 2
  elif ! declare -a "$1" &>/dev/null
  then
    log 2 "Not an array: $1"
    return 1
  else
    local -r ARR="$1"
    echo "${#ARR[@]}"
    return 0
  fi
}

# This function uses /dev/urandom to generate a password randomly.
# Default length is 36, another length can be specified by 1st argument value
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
    log 2 "OpenSSL command not available"
    return 1
  fi
}

# Gets the PATH for a script file
getScriptPath() {
  if [[ "$#" -eq 1 ]]
  then
    PTH=$(type -p "$1")
    file "$PTH"
  fi
}

# Records the output of a command to a file.
recordCommandOutput() {
  if [[ "$#" -eq 1 ]]
  then
    local -r COMMAND="$1" LOGFILE="log.txt"
    if test -f "$LOGFILE"
    then
      log -1 "$LOGFILE exists, appending to existing file"
      echo "Appending new output from $COMMAND" | tee -a "$LOGFILE"
      bash -c "$COMMAND" | tee -a "$LOGFILE"
      return 0
    else
      touch "$LOGFILE"
      bash -c "$COMMAND" | tee -a "$LOGFILE"
      log 0 "Command output recorded to $LOGFILE"
      return 0
    fi
  else
    log 2 "Requires 1 argument: [Command to record output of]"
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
  if [[ "$#" -gt 0 ]]
  then
    local -r LOGLEVEL="$1" TEXT="${*:2}" Z='\e[0m'
    if [[ "$LOGLEVEL" =~ [(-2)-2] ]]
    then
      case "$LOGLEVEL" in
        -2)
          local -r CYAN='\e[1;36m'
          printf "${CYAN}DEBUG${Z}: %s\n" "$TEXT"
          ;;
        -1)
          local -r BLUE='\e[1;34m'
          printf "${BLUE}INFO${Z}: %s\n" "$TEXT"
          ;;
        0)
          local -r GREEN='\e[1;32m'
          printf "${GREEN}SUCCESS${Z}: %s\n" "$TEXT"
          ;;
        1)
          local -r YELLOW='\e[1;33m'
          printf "${YELLOW}WARNING${Z}: %s\n" "$TEXT"
          ;;
        2)
          local -r RED='\e[1;31m'
          printf "${RED}ERROR${Z}: %s\n" "$TEXT"
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
