#!/usr/bin/env bash
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# This script prints my name, email or signature to the terminal
set -euf -o pipefail
CLR='\e[0;36m'
ERR='\e[0;31m'
RS='\e[0m'
name() {
  local -r name="Victor-ray, S."
  printf "${CLR}%s${RS}\n" "$name"
}
email() {
  local -r email="<12261439+ZendaiOwl@users.noreply.github.com>"
  printf "${CLR}%s${RS}\n" "$email"
}
author()
{
  local -r author="Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>"
  printf "${CLR}%s${RS}\n" "@author $author"
}
signature()
{
  local -r signature="Signed-off-by: Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>"
  printf "${CLR}%s${RS}\n" "$signature";
}
if [[ "$#" -eq 0 ]]
then
  printf "${ERR}%s${RS}\n" "I'm a teapot."
  signature
  exit 1
elif [[ "$*" =~ (--name) ]]; then { name; }
elif [[ "$*" =~ (--email) ]]; then { email; }
elif [[ "$*" =~ (--author) ]]; then { author; }
elif [[ "$*" =~ (--signature) ]]; then { signature; }
elif [[ "$*" =~ (--all) ]]; then { author; name; email; signature; }
else
  printf "${ERR}%s${RS}\n" "Invalid argument"
  exit 1
fi
set +euf -o pipefail
exit 0
