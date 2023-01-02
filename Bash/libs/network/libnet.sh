#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Network Functions
#
# Test if a port is open or closed on a remote host
# Exit codes
# 1: Open
# 2: Closed
# 3: Invalid number of arguments
testRemotePort() {
  if test "$#" -eq 2
  then
    local -r HOST="$1" PORT="$2"
    if timeout 2.0 bash -c "true &>/dev/null>/dev/tcp/$HOST/$PORT"
    then
      echo "open" && return 0
    else
      echo "closed" && return 1
    fi
  else
    echo "Requires: [HOST] [PORT]" && return 2
  fi
}

# Queries DNS record of a domain
getDNSRecord() {
  if test "$#" -gt 1
  then
    local -r DOMAIN="$1" RECORD="$2"
    dig "$DOMAIN" "$RECORD" +short
  else
    local -r DOMAIN="$1"
    dig "DOMAIN" +short
  fi
}

# Gets the public IP for the network
getPublicIP() {
  local -r IPv4=$(curl --silent --max-time 4 --ipv4 ipv4.icanhazip.com 2>/dev/null || echo 'N/A') \
           IPv6=$(curl --silent --max-time 4 --ipv6 ipv6.icanhazip.com 2>/dev/null || echo 'N/A')
  printf '%s\n%s\n' "IPv4: $IPv4" "IPv6: $IPv6"
}

# Tests for Public IPv4
# 0: IPv4 available
# 1: IPv4 unavailable
testPublicIPv4() {
  curl --silent --max-time 4 --ipv4 ipv4.icanhazip.com &>/dev/null
}

# Tests for Public IPv6
# 0: IPv4 available
# 1: IPv4 unavailable
testPublicIPv6() {
  curl --silent --max-time 4 --ipv6 ipv6.icanhazip.com &>/dev/null
}

# Gets the listening ports on the system
getListeningPorts() {
  test "$EUID" -eq 0 && grep 'LISTEN' <(lsof -i -P -n)
  test "$EUID" -ne 0 && grep 'LISTEN' <(sudo lsof -i -P -n)
}

# Gets the services running on the network interfaces
getNetworkInterfaceServices() {
  test "$EUID" -eq 0 && lsof -nP -i
  test "$EUID" -ne 0 && sudo lsof -nP -i
}

# Gets the HTML code for a URL with Bash TCP
# Reuires the host TCP server to listen on HTTP, not HTTPS 
getURL() {
  if test "$#" -eq 2
  then
    local -r HOST="$1" PORT="$2"
    exec 5<>/dev/tcp/"$HOST"/"$PORT"
    echo -e "GET / HTTP/1.1\r\nHost: $HOST\r\nConnection: close\r\n\r" >&5
    cat <&5 && return 0
  else
    echo "Requires: [HOST] [PORT]" && return 1
  fi
}
