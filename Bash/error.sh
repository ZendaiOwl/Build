#!/usr/bin/env bash
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# An error function to be used for sending error messages
set -euf -o pipefail
function error {
  local reset black red green yellow blue purple cyan white prefix
  reset='\e[0m'           # Text Reset
  black='\e[0;30m'        # Black
  white='\e[0;37m'        # White
  cyan='\e[0;36m'         # Cyan
  purple='\e[0;35m'       # Purple
  blue='\e[0;34m'         # Blue
  yellow='\e[0;33m'       # Yellow
  green='\e[0;32m'        # Green
  red='\e[0;31m'          # Red
  prefix="${red}ERROR${reset}:"
  readonly reset black red green yellow blue purple cyan white prefix
  printf "${prefix} %s\\n" "$*" 1>&2
}
error "$*"
set +euf -o pipefail
exit 0

