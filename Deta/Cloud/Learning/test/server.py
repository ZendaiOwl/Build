#!/usr/bin/env python3
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
from sanic import Sanic
from sanic.response import json
from sanic.response import text
import ipaddress
import socket

app = Sanic("portcheck")

@app.route('/')
@app.route('/<path:path>')
async def index(request, path=""):
    return json({'hello': path})

@app.post("/ipv4")
async def check_port4(request):
    data = request.json
    key = data['key']
    print(data)
    print(key)
    if await scan(key,80):
      print("Open")
      result = "Open"
    else:
      print("Closed")
      result = "Closed"
    return json({"IPv4":result})

@app.post("/ipv6")
async def check_port6(request):
    data = request.json
    key = data['key']
    print(data)
    print(key)
    if socket.has_ipv6:
      print("IPv6 is supported")
      if await check(key,80):
        print("Open")
        result = "Open"
      else:
        print("Closed")
        result = "Closed"
    else:
      print("IPv6 is not supported")
    return json({"IPv6":result})

async def scan(ip4,port4):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1.5)
    try:
      con = sock.connect((ip4,int(port4)))
      result = True
    except:
      result = False
    finally:
      sock.close()
    return result

async def check(ip6,port6):
    sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM, 0)
    sock.settimeout(1.5)
    try:
      con = sock.connect((ip6,int(port6)))
      result = True
    except:
      result = False
    finally:
      sock.close()
    return result

if __name__ == "__main__":
  app.run(host="0.0.0.0", fast=True)
