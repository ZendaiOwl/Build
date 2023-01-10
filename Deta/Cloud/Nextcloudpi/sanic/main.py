#!/usr/bin/env python3
# @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
import socket, os, base64, hashlib, time, ipaddress, requests
from urllib.request import urlopen
from sanic import Sanic
from sanic import response
from sanic.response import json, html
from deta import Base

app = Sanic('NCPDocs')
app.config.REAL_IP_HEADER = "Fly-Client-IP"
base = Base('ncp_docs_database')

#@app.route("/")
#@app.get("/<path:path>")
async def index(request):
    return json({"Hello": "there"})

async def index_path(request, path):
    return json({"Hello": path})

#@app.get("/fetch/docs")
async def fetch_docs(request):
  NCPDocs = "https://help.nextcloud.com/c/ncpdocs/178.json"
  key = "topics"
  try:
    data = requests.get(NCPDocs).json()
    topic_list = data['topic_list']
    topics = topic_list['topics']
    putTopics = base.put(topics, key)
    msg = json(putTopics)
  except:
    msg = json({"docs": "error"})
  return msg

#@app.get("/fetch/topics")
async def fetch_topics(request):
  key = "topics"
  try:
    topics = base.get(key)
    value = topics.get("value")
    out = []
    for top in value:
      topic_id = top.get("id")
      bump = top.get("bumped_at")
      title = top.get("title")
      obj = {"id": topic_id,"edited": bump, "title": title}
      out.append(obj)
  except:
    return json({"msg": False})
  return json(out)

#@app.route("/fetch")
#@app.get("/fetch/<article_id:article_id>")
async def fetch_article(request, doc):
  key = "topics"
  NCPDocsTopic = ("https://help.nextcloud.com/t/" + doc + ".json")
  try:
    article = requests.get(NCPDocsTopic).json()
    title = article.get("title")
    post_stream = article.get("post_stream")
    posts = post_stream.get("posts")
    cooked = posts[0].get("cooked")
    obj = {"title": title, "content": cooked}
    print(obj)
    output = ('<h1>' + title + '</h1>')
    output += cooked
    return html(output)
  except:
    data = json({"article": False})
    return data

async def save_article(request, article):
  try:
    artic = base.put(request.json, article)
  except:
    artic = json({"saved": False})
  return artic

#app.add_route(index, '/<path:path>', methods=['GET'])
app.add_route(index, '/', methods=['GET'])
app.add_route(index_path, '/<path>', methods=['GET'])
app.add_route(fetch_docs, '/docs', methods=['GET'])
app.add_route(fetch_topics, '/topics', methods=['GET'])
app.add_route(fetch_article, '/doc/<doc>', methods=['GET'])
app.add_route(save_article, '/save/<article>', methods=['PUT'])

def topic_insert(topic_data):
  topic_id = topic_data.get("id")
  topic = topic_data.get("topic")
  try:
    msg = base.put(topic, topic_id)
    print(msg)
    for d in msg:
      print(d)
  except:
    msg = ("error")
  return json({"message": msg})

if __name__ == '__main__':
    app.run(host="0.0.0.0", fast=True)
