#!/usr/bin/env bash
set -euo pipefail
# Replaces matching text pattern in all files of current directory and its sub-directories
# 1 = Old text
# 2 = New text
# 3 = File
# @ZendaiOwl
# 16-bit colours
# B='\e[34m'
# G='\e[32m'
# O='\e[33m'
# W='\e[37m'
# D='\e[39m'
# Z='\e[0m'
logReplace() {
  local -r G='\e[32m' O='\e[33m' Z='\e[0m' PFX="REPLACE"
	test "$#" -eq 3 \
  && printf "${G}%s${Z}: ${O}%s${Z} %s ${O}%s${Z}\n" "$PFX" "$1" "$2" "$3" \
  || printf "${G}%s${Z}: %s\n" "$PFX" "$*"
}
logFile() {
  local -r B='\e[34m' Z='\e[0m' PFX="FILE"
	printf "${B}%s${Z}: %s\n" "$PFX" "$*"
}
if [ "$#" -eq 2 ]; then
  logReplace "$1" "with" "$2"
  for FILE in $(grep --recursive --files-with-matches "$1")
  do
    logFile "$FILE"
    sed -i "s|$1|$2|g" "$FILE"
  done
  logReplace "Done"
else
  echo "Usage: [Old Text] [New Text] [File Path]"
fi

exit
