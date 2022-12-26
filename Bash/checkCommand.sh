#!/usr/bin/env bash
# Checks if a comand is installed or not
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euf -o pipefail
if test "$#" -gt 0
then
  CHECK="$1"
  if ! command -v "$CHECK" > /dev/null
  then
    echo "Not installed"
    exit 1
  else
    echo "Installed"
    exit 0
  fi
else
  echo "No command supplied as argument."
fi
set +euf -o pipefail
exit 0
