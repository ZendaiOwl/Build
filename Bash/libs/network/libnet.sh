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
  if [[ "$#" -eq 2 ]]
  then
    local -r HOST="$1" PORT="$2"
    if timeout 2.0 bash -c "true &>/dev/null>/dev/tcp/${HOST}/${PORT}"
    then
      echo "Open"
      return 0
    else
      echo "Closed"
      return 1
    fi
  else
    echo "Requires: [HOST] [PORT]"
    return 2
  fi
}

# Queries DNS record of a domain
getDNSRecord() {
  if [[ "$#" -gt 1 ]]
  then
    local -r DOMAIN="$1" RECORD="$2"
    dig "$DOMAIN" "$RECORD" +short
  else
    local -r DOMAIN="$1"
    dig "$DOMAIN" +short
  fi
}

# Gets the public IP for the network
getPublicIP() {
  local -r URLIPv4="https://ipv4.icanhazip.com" URLIPv6="https://ipv6.icanhazip.com"
  local -r IPv4=$(curl --silent --max-time 4 --ipv4 "$URLIPv4" 2>/dev/null || echo 'N/A') \
           IPv6=$(curl --silent --max-time 4 --ipv6 "$URLIPv6" 2>/dev/null || echo 'N/A')
  printf 'IPv4: %s\nIPv6: %s\n' "$IPv4" "$IPv6"
}

# Gets the local IP for the device
# IPv4, IPv6 & Link-local
getLocalIP() {
  if command -v jq &>/dev/null
  then
    ip -j address | jq '.[2].addr_info' | jq -r '.[].local'
  fi
}

# Gets all the local IP-addresses on the device
getAllLocalIP() {
  if command -v jq &>/dev/null
  then
    ip -j address | jq '.[].addr_info' | jq -r '.[].local'
  fi
}

# Tests for Public IPv4
# 0: Public IPv4 Available
# 1: Public IPv4 Unavailable
testPublicIPv4() {
  local -r URL="https://ipv4.icanhazip.com"
  if curl --silent --max-time 4 --ipv4 "$URL" &>/dev/null
  then
    echo "Available"
    return 0
  else
    echo "Unavailable"
    return 1
  fi
}

# Tests for Public IPv6
# 0: Public IPv6 Available
# 1: Public IPv6 Unavailable
testPublicIPv6() {
  local -r URL="https://ipv6.icanhazip.com"
  if curl --silent --max-time 4 --ipv6 "$URL" &>/dev/null
  then
    echo "Available"
    return 0
  else
    echo "Unavailable"
    return 1
  fi
}

# Gets the listening ports on the system
getListeningPorts() {
  if [[ "$EUID" -eq 0 ]]
  then
    grep 'LISTEN' <(lsof -i -P -n)
  else
    sudo lsof -i -P -n | grep 'LISTEN'
  fi
}

# Gets the services running on the network interfaces
getNetworkInterfaceServices() {
  if [[ "$EUID" -eq 0 ]]
  then
  	lsof -nP -i
  else
  	sudo lsof -nP -i
  fi
}

# Gets the HTML code for a URL with Bash TCP
# Reuires the host TCP server to listen on HTTP, not HTTPS 
getURL() {
  if [[ "$#" -eq 2 ]]
  then
    local -r HOST="$1" PORT="$2"
    exec 5<>/dev/tcp/"$HOST"/"$PORT"
    echo -e "GET / HTTP/1.1\r\nHost: ${HOST}\r\nConnection: close\r\n\r" >&5
    cat <&5
    return 0
  else
    echo "Requires: [HOST] [PORT]"
    return 1
  fi
}
