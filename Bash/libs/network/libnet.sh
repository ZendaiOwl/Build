#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
#
# Bash - Network Functions
#

# Test if a port is open or closed on a remote host
# Return codes
# 0: Open
# 1: Closed
# 2: Invalid number of arguments
testRemotePort() {
  if test "$#" -eq 2
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
  local -r URLIPv4="ipv4.icanhazip.com" URLIPv6="ipv6.icanhazip.com"
  local -r IPv4=$(curl --silent --max-time 4 --ipv4 "$URLIPv4" 2>/dev/null || echo 'N/A') \
           IPv6=$(curl --silent --max-time 4 --ipv6 "$URLIPv6" 2>/dev/null || echo 'N/A')
  printf '%s\n%s\n' "IPv4: $IPv4" "IPv6: $IPv6"
}

# Tests for Public IPv4
# 0: Public IPv4 Available
# 1: Public IPv4 Unavailable
testPublicIPv4() {
  local -r URL="ipv4.icanhazip.com"
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
  local -r URL="ipv6.icanhazip.com"
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
  if test "$EUID" -eq 0
  then
    grep 'LISTEN' <(lsof -i -P -n)
  else
    grep 'LISTEN' <(sudo lsof -i -P -n)
  fi
}

# Gets the services running on the network interfaces
getNetworkInterfaceServices() {
  if test "$EUID" -eq 0
  then
  	lsof -nP -i
  else
  	sudo lsof -nP -i
  fi
}

# Gets the HTML code for a URL with Bash TCP
# Reuires the host TCP server to listen on HTTP, not HTTPS 
getURL() {
  if test "$#" -eq 2
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
