from flask import Flask, render_template, request, jsonify
from deta import Deta
import json
from json import loads, dumps
import os
from igramscraper.instagram import Instagram
from LevPasha.InstagramAPI import InstagramAPI

deta = Deta(os.getenv('DETA_ACCESS_TOKEN'))
db = deta.Base(os.getenv('BASE_NAME'))
drive = deta.Drive(os.getenv('DRIVE_NAME'))
app = Flask(__name__)

@app.route('/', methods=["GET"])
async def index():
    return render_template("index.html")

@app.route("/root", methods=["GET"])
async def root_page():
    return render_template("root.html")

@app.route("/some.js", methods=["GET"])
async def js_file():
    return render_template("some.js")

@app.route("/test", methods=["POST"])
async def test_handler():
    data = request.get_json()
    key =       data['key']
    username =  data['username']
    password =  data['password']
    postID =    data['postID']
    msg = ({
        "key":        key,
        "username":   username,
        "password":   password,
        "postID":     postID
    })
    return jsonify(msg)

@app.route('/data', methods=["POST"])
async def create_user():
    data = request.get_json()
    key =       data['key']
    username =  data['username']
    password =  data['password']
    postID =    data['postID']
    msg = ({
        "key":        key,
        "username":   username,
        "password":   password,
        "postID":     postID
    })
    dataResponse = db.put(msg)
    return dataResponse

@app.route("/users/<key>")
async def get_user(key):
    user = db.get(key)
    return user if user else jsonify({"error": "Not found"}, 404)

@app.route("/users/<key>", methods=["PUT"])
async def update_user(key):
    user = db.put(request.json, key)
    return user

@app.route("/users/<key>", methods=["DELETE"])
async def delete_user(key):
    db.delete(key)
    return jsonify({"status": "ok"}, 200)

@app.route("/userlist", methods=["GET"])
async def user_list():
    userList = db.fetch()
    return json(userList)
