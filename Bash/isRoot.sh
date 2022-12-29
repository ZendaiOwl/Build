#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
test "$EUID" -eq 0 && return 0
test "$EUID" -ne 0 && return 1
