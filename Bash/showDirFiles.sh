#!/usr/bin/env bash
# Counts the number of files in working directory's directory & all its subdirectories excluding hidden directories.
function showDirFiles() {
	set -euf -o pipefail
    grep --files-with-matches --recursive --exclude-dir='.*' ''
	set +euf -o pipefail
}
showDirFiles
exit 0
