#!/usr/bin/env bash
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euf -o pipefail
GHSignOff="GitHub Sign-off\nSigned-off-by: Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>"
JSAuthor="JavaScript\n/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */"
JavaAuthor="Java\n/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */"
BASHAuthor="Bash\n# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>"
printf "$BASHAuthor\n\n$JavaAuthor\n\n$JSAuthor\n\n$GHSignOff\n"
set +euf -o pipefail
exit 0
