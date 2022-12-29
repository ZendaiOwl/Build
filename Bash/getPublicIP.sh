#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
# Gets the Public IPv4 & IPv6 for the network, if it exists.
function getPublicIP {
  local -r IPv4=$(curl --silent --max-time 4 --ipv4 ipv4.icanhazip.com 2>/dev/null || echo 'N/A') \
           IPv6=$(curl --silent --max-time 4 --ipv6 ipv6.icanhazip.com 2>/dev/null || echo 'N/A')
  printf '%s\n%s\n' "IPv4: $IPv4" "IPv6: $IPv6"
}
getPublicIP;
exit 0
