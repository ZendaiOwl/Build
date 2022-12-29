#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
# Generates a password using OpenSSL, default length is 36.
openssl rand -base64 "${1:-36}" && exit 0
