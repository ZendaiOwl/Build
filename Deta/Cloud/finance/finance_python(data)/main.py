from sanic import Sanic
from sanic.response import json
from sanic.response import text
#import ipaddress
#import socket

app = Sanic("data")

@app.route('/')
@app.route('/<path:path>')
async def index(request, path=""):
    return json({'hello': path})

if __name__ == "__main__":
  app.run(host="0.0.0.0", fast=True)
