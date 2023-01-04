#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
test "$EUID" -eq 0 && { echo "Is root" && exit 0; } || { echo "Not root" && exit 1; }
