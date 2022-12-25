#!/usr/bin/env bash
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Creates a noteringar.txt file in the current working directory
# Writes subsequent arguments to the file preceeded by a timestamp 
# Just a simple way of making a note
set -euo pipefail
WRITE="$@";
DIRN=$(dirname "${BASH_SOURCE}");
FILPATH="${DIRN}/noteringar.txt";
FILN="noter.txt";
FIL="./noter.txt";
TIM="$(date)";

if [[ -e "$FIL" ]] && 
  [[ -f "$FIL" ]] && 
  [[ -r "$FIL" ]] && 
  [[ -w "$FIL" ]]; 
then
  echo "Appending";
  printf '%s %s %s\n' "$TIM" ":" "$WRITE" | tee -a ${FIL};
  # echo "$TIM $WRITE" | tee -a ${FIL};
else
  read -rp "Create? (Y/N): " input;
  if [ "$input" == "y" ] || [ "$input" == "Y" ]
  then
    echo "Creating $FILN";
    # echo "$WRITE" > ${FIL};
    echo "$TIM : $WRITE";
    echo "$TIM : $WRITE" > ${FIL};
    # printf '%s\t%s\n' "$TIM" "$WRITE" | tee -a ${FIL};
  elif [ "$input" == "n" ] || [ "$input" == "N" ]
  then
    echo "Selected N/n → Exit..";
    exit 2;
  else
    echo "Invalid input: $input";
  fi
fi
set +euo pipefail
exit 0
