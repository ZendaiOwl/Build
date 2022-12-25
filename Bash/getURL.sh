#!/usr/bin/env bash
if test "$#" -eq 2
then
  HOST="$1"
  PORT="$2"
  exec 5<>/dev/tcp/"$HOST"/"$PORT"
  echo -e "GET / HTTP/1.0\\n" >&5
  cat <&5
  echo
  echo "Connection: close"
  echo "Host: $HOST"
else
  echo "Requires: [HOST] [PORT]"
fi
exit 0
