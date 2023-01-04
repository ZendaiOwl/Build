#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
# Sends a HTTP request using Bash
# If the host TCP server responds to HTTP it will fetch the HTML page in the terminal
if test "$#" -eq 2
then
  HOST="$1" PORT="$2"
  exec 5<>/dev/tcp/"$HOST"/"$PORT"
  echo -e "GET / HTTP/1.1\r\nHost: $HOST\r\nConnection: close\r\n\r" >&5
  cat <&5;
else
  echo "Requires: [HOST] [PORT]" && exit 1
fi
