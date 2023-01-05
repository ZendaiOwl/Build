import os
from sanic import Sanic
from sanic.response import json
from deta import Base

app = Sanic('SanicDeta')
base = Base('sanic_database')

@app.route("/")
@app.get("/<path:path>")
async def index(request, path=""):
    return json({"hello": path})

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
