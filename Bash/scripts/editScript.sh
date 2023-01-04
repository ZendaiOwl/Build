#!/usr/bin/env bash
# This is a simple script I wrote to quickly edit my Bash scripts.
# Victor-ray, S. | Zendai Owl <12261439+ZendaiOwl@users.noreply.github.com>
function editScript {
local -r scriptDir="${HOME}/bin/scripts"
set -euf -o pipefail
[[ "$#" -eq 1 ]] && local SCR="$1"; 
[[ -n "$SCR" ]] && "$HOME"/bin/micro "${scriptDir}/${SCR}" || printf '%s\n' "ERR - Couldn't open script"
set +euf -o pipefail
}

editScript "$@"

exit 0

