#!/usr/bin/env bash
set -euf -o pipefail

function checkPublicIP {
  local ipv4_check ipv6_check ip_url ipv4_args ipv6_args public_ipv4 public_ipv6
  readonly ip_url="https://icanhazip.com"
  readonly ipv4_args=(-s -m4 -4 "${ip_url}")
  readonly ipv6_args=(-s -m4 -6 "${ip_url}")
  ipv4_check=True
  ipv6_check=True
  public_ipv4=$(curl "${ipv4_args[@]}" 2>/dev/null) || { ipv4_check=False; }
  public_ipv6=$(curl "${ipv6_args[@]}" 2>/dev/null) || { ipv6_check=False; }
  printf '%s\n%s\n' "IPv4: [${ipv4_check}] ${public_ipv4}" "IPv6: [${ipv6_check}] ${public_ipv6}"
}

checkPublicIP;

exit 0

