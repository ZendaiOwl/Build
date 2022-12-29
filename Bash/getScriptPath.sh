#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
# Gets a scripts filepath and prints info about the file using 'file'
test "$#" -eq 1 && {
  PTH=$(type -p "$1")
  file "$PTH"
  exit 0
}
exit 1

