#!/usr/bin/env bash
set -euo pipefail
# Replaces text in a file
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
colour() {
  local -r G='\e[32m' Z='\e[0m' PFX="REPLACE"
	printf "${G}%s${Z}: %s\n" "$PFX" "$*"
}
if [ "$#" -eq 3 ]; then
colour "[$1] with [$2]"
sed -i "s|$1|$2|g" "$3"
else
echo "Usage: [Old Text] [New Text] [File Path]"
fi

exit
