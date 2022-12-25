#!/usr/bin/env bash
# Adds and updates Dotz.git repository
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> (ZendaiOwl)

function addDotz {
set -euf -o pipefail
local -r dotz="/usr/bin/git --git-dir=${HOME}/.dotz/ --work-tree=${HOME}"
local -r scripts="${HOME}/bin/scripts/*.sh"
local -r profile="${HOME}/.profile"
local -r aliases="${HOME}/.bash_aliases"
local msgArgs message exclude=()
if [[ "$*" =~ (-m|--m|--message) ]]; then
  msgArgs=("$@")
  [[ "${msgArgs[*]}" =~ (-m) ]] && exclude+=("-m")
  [[ "${msgArgs[*]}" =~ (--m) ]] && exclude+=("--m")
  [[ "${msgArgs[*]}" =~ (--message) ]] && exclude+=("--message")
  message="࿓❯ ${msgArgs[*]/${exclude[*]}]}"
else
  message="࿓❯ Updating Dotz scripts"
fi
"$dotz" add "$scripts" && \
"$dotz" add "$profile" && \
"$dotz" add "$aliases" && \
"$dotz" commit --signoff -S -m "$message" && \
"$dotz" push || return 1
set +euf +o pipefail
return 0
}

[[ "$#" -eq 0 ]] && addDotz
[[ "$#" -gt 0 ]] && addDotz "$@"

exit 0

