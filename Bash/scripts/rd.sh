#!/usr/bin/env bash
# This is a function to use $(<) for reading files to STDOUT
[[ -f "$1" ]] && printf '%s\n' "$(<$1)" || printf '%s\n' "Not a file"
