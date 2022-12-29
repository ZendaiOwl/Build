#!/usr/bin/env bash
# Shows the number of files in working directory's directory & all its subdirectories excluding hidden directories.
function showDirFiles() {
  grep --files-with-matches --recursive --exclude-dir='.*' '' && exit 0
}
showDirFiles
