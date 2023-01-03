#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
function getIP {
  local -r IPv4="ipv4.icanhazip.com" IPv6="ipv6.icanhazip.com"
  PublicIPv4=$(curl --silent --location --max-time 4 --ipv4 "$IPv4" || echo N/A)
  PublicIPv6=$(curl --silent --location --max-time 4 --ipv6 "$IPv6" || echo N/A)
  printf '%s\n%s\n' "IPv4: $PublicIPv4" "IPv6: $PublicIPv6"
}
getIP
