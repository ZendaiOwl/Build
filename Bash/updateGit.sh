#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euo pipefail
trap 'exit $?' EXIT ERR SIGTERM SIGABRT
function updateGitRepository {
  local ADDIR MSG COMSG
  local -r GPG_KEY_ID="E2AC71651803A7F7"
  
  if [[ "$#" -eq 1 ]] ; then
    ADDIR="$PWD"
    MSG="$1"
  elif [[ "$#" -gt 1 ]] ; then
    ADDIR="$1"
    MSG="${*:2}"
  fi
  (
    COMSG="࿓❯ $MSG"
    local -r GIT_COMMIT_ARGS=(--signoff --gpg-sign="$GPG_KEY_ID" -m "$COMSG")
    git add "$ADDIR"
    git commit "${GIT_COMMIT_ARGS[@]}"
    git push
  )
}
updateGitRepository "$@"
set +euo pipefail
exit 0
