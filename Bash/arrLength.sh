#!/usr/bin/env bash

if [[ "$#" -eq 1 ]]; then
  ARR="$1"
  echo "${#ARR[@]}";	
else
  echo "Usage: Array as 1 argv";
fi

exit 0
