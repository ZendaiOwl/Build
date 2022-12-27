#!/usr/bin/env python3
from sanic import Sanic
from sanic.response import text, json, html
from sanic.log import logger
import logging

logging.getLogger('sanic.root').propagate = False
logging.getLogger('sanic.access').propagate = False
logger.propagate = False

app = Sanic('webhook')

@app.post('/')
async def query(request):
  theID = ("M2FmNDlhMDUtNWUzNy1iZjJiLTYzNjUtMDEwZWZkYzgyZDYz")
  args = request.args
  userID = args.get('userId')
  if userID == theID:
    data = request.json
    ticker = data['ticker']
    action = data['action']
    logger.info(request.json)
    return json({"received": True})
  else:
    return json({"received": False, "message": "unauthorized"})

@app.get('/<path:path>')
async def index(request, path=""):
  logger.info("Accessed: " + path)
  return json({"path": path})

if __name__ == '__main__':
  app.run(host='0.0.0.0', fast=True, debug=False, access_log=False)
