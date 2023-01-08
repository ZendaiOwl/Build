import os
import base64
import hashlib
import argon2
import time
from sanic import Sanic
from sanic.response import json
from deta import Base

app = Sanic('SanicDeta')
app.config.REAL_IP_HEADER = "Fly-Client-IP"
base = Base('sanic_database')

argon2Hasher = argon2.PasswordHasher(
    time_cost=3, # number of iterations
    memory_cost=12 * 1024, # 64mb
    parallelism=1, # how many parallel threads to use
    hash_len=32, # the size of the derived key
    salt_len=16 # the size of the random generated salt in bytes
)

@app.route("/")
@app.get("/<path:path>")
async def index(request, path=""):
    return json({"hello": path})

@app.get("/client")
async def client_handler(request):
  client = request.headers.get("Fly-Client-IP")
  clientHash = hash(client)
  ts = time.time()
  # readable = time.ctime(ts)
  try:
    res = base.put({
      "client": clientHash,
      "time": ts
    })
  except:
    res = False
  return json({"created": res})

@app.post("/test")
async def test_database(request):
  name = request.json.get("name")
  message = request.json.get("message")
  try:
    test = base.put({
      "name": name,
      "message": message
    })
  except:
    test = ("error")
  return json({"created": True, "message": test})
