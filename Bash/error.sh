#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# An error function to be used for sending error messages
error() {
  local -r Z='\e[0m' R='\e[0;31m' PFX="ERROR"
  printf "${R}${PFX}${Z}: %s\n" "$*" && exit 0
}
test "$#" -gt 0 && error "$*"
