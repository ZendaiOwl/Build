#!/bin/bash
set -euo pipefail

trap "exit $?" EXIT ERR SIGTERM SIGABRT

function updateGitRepository {
  local addir msg comsg gpg_key git_commit_args
  local -r gpg_key_id="E2AC71651803A7F7"
  if [[ "$#" -eq 1 ]] ; then
  	addir=$(pwd)
  	msg="$1"
  elif [[ "$#" -gt 1 ]] ; then
  	addir="$1"
  	msg="${@:2}"
  fi
  (
    comsg="࿓❯ ${msg}"
    git add "${addir}"
    git_commit_args=(--signoff --gpg-sign="${gpg_key_id}" -m "${comsg}")
    readonly git_commit_args
    git commit "${git_commit_args[@]}"
    git push
  )
}

updateGitRepository "$@"

exit 0
