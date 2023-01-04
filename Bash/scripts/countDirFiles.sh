#!/usr/bin/env bash
# Shows the number of files in working directory's directory & all its subdirectories excluding hidden directories.
function countDirFiles() {
	set -euf -o pipefail
    grep --recursive --files-with-matches --exclude-dir='.*' '' | wc -l
	set +euf -o pipefail
}
countDirFiles
exit 0
