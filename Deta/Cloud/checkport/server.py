#!/usr/bin/env python3
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
from sanic import Sanic
from sanic.response import json
from sanic.response import text
import ipaddress
import socket
import re

app = Sanic("portcheck")

@app.route('/<path:path>')
async def index(request, path=""):
    return json({'hello': path})

@app.get('/checkTest')
async def check_ports_test(request):
    host = request.headers.get("host")
    clientIP = request.ip
    protocol = ("")
    port80 = ("")
    port443 = ("")
    try:
      ip = ipaddress.ip_address(clientIP)
      result = ("valid")
      if isinstance(ip, ipaddress.IPv4Address):
        protocol = ("IPv4")
        port80 = await checkIPv4(clientIP,80)
        port443 = await checkIPv4(clientIP,443)
      elif isinstance(ip, ipaddress.IPv6Address):
        protocol = ("IPv6")
        port80 = await checkIPv6(clientIP, 80)
        port443 = await checkIPv6(clientIP, 443)
    except ValueError:
      result = ("invalid")
    except:
      result = ("error")
    return json({"ip":result,"type":protocol,"80":port80,"443":port443})

@app.get('/check')
async def check_ports(request):
    clientIP = request.ip
    protocol = ("")
    port80 = ("")
    port443 = ("")
    try:
      validate = await validateIP(clientIP)
      if validate == 0:
        result = ("valid")
        if await getIPversion(clientIP) == 4:
          protocol = ("IPv4")
          port80 = await checkIPv4(clientIP, 80)
          port443 = await checkIPv4(clientIP, 443)
        else:
          protocol = ("IPv6")
          port80 = await checkIPv6("ipv6.google.com", 80)
          port443 = await checkIPv6("ipv6.google.com", 443)
      elif validate == 1:
        result = ("invalid")
      else:
        result = ("error")
    except:
      result = ("error")
    return json({"client":clientIP,"ip":result,"type":protocol,"80":port80,"443":port443})

@app.get('/client')
async def get_client_ip(request):
    headers = request.headers
    host = headers.get("host")
    ip = request.ip
    return json({"ip":ip})

@app.get('/dual-stack')
async def dual_stack_test(request):
    result = socket.has_dualstack_ipv6()
    return json({"dual-stack": result})

async def validateIP(incomingIP):
    try:
      ip = ipaddress.ip_address(incomingIP)
      validation = 0
    except ValueError:
      validation = 1
    except:
      validation = -1
    return validation

async def getIPversion(theIP):
    try:
      ip = ipaddress.ip_address(theIP)
      if isinstance(ip, ipaddress.IPv4Address):
        protocol = 4
      elif isinstance(ip, ipaddress.IPv6Address):
        protocol = 6
    except:
      protocol = "error"
    return protocol

async def checkIPv4(IPv4, portIPv4):
    IPv4socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    IPv4socket.settimeout(1.5)
    try:
      IPv4socket.connect((IPv4,int(portIPv4)))
      result = "open"
    except:
      result = "closed"
    finally:
      IPv4socket.close()
    return result

async def checkIPv6(IPv6, portIPv6):
    IPv6socket = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
    IPv6socket.settimeout(1.5)
    try:
      IPv6socket.connect((IPv6,int(portIPv6)))
      result = "open"
    except:
      result = "closed"
    finally:
      IPv6socket.close()
    return result

if __name__ == "__main__":
  app.run(host="0.0.0.0",fast=True)
