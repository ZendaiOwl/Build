#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
set -euf -o pipefail
function getIP {
  local -r IPv4="ipv4.icanhazip.com" IPv6="ipv6.icanhazip.com"
  PublicIPv4=$(curl -sL "$IPv4" || echo N/A)
  PublicIPv6=$(curl -sL "$IPv6" || echo N/A)
  printf '%s\n%s\n' "IPv4: $PublicIPv4" "IPv6: $PublicIPv6"
}
getIP;
exit 0
