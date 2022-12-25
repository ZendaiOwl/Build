from LevPasha.InstagramAPI import InstagramAPI
from igramscraper.instagram import Instagram
from deta import Deta
from sanic import Sanic
from sanic import response
from sanic.request import Request
from sanic.log import logger
from json import loads, dumps
from time import sleep
import os
# import ssl
import sys
import subprocess

deta = Deta(os.getenv("DETA_ACCESS_TOKEN"));
db = deta.AsyncBase(os.getenv("BASE_NAME"));
drive = deta.Drive(os.getenv("DRIVE_NAME"));

app = Sanic(__name__)
 
# def app(event):
    # return "Hello, world!"
# 


# app.blueprint(my_bp)

# app.static('/dist','/var/www/instagramfollower-ui/dist/index.html')

# Create a simple Sanic app route for the base path of the Vercel web app and give it a simple HTML page with 
# the Global Carbon Clock as a front page.
@app.route("/")
async def index(request):
    # return json({"message": "Hello World!"})
    return html("""
    <!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8"/>
		<meta name="robots" content="noindex,nofollow">
		<meta content="" name="description"/>
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.9.3/css/bulma.min.css" integrity="sha512-IgmDkwzs96t4SrChW29No3NXBIBv8baW490zk5aXvhCD8vuZM3yUSkbyTBcXohkySecyzIrUwiF/qV0cuPcL3Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css" integrity="sha512-IgmDkwzs96t4SrChW29No3NXBIBv8baW490zk5aXvhCD8vuZM3yUSkbyTBcXohkySecyzIrUwiF/qV0cuPcL3Q==" crossorigin="anonymous" referrerpolicy="no-referrer">
	<title>Instagram Follower</title>
	</head>
	<body>
	    <div class="box">Hello</div>
	</body>
	</html>
	""")

# @app.on_response
# async def add_request_id_header(request, response):
    # response.headers["X-Request-ID"] = request.id

@app.route("/run")
def run_handler(request):
    return response.text("Hello there")

@app.route("/demo")
def display(request):
    return file('/var/www/instagramfollower-ui/index.html')

@app.post("/debug")
def debug_handler(request):
    data = loads(request.body)
    return response.text(data)

# A Sanic app.route POST method for getting a userlist from a post on Instagram.
@app.post("/userlist")
def on_post(request):
    # Get the data from the request.
    data = loads(request.body)
    # Get the username, password and postId from the data.
    username = data["username"]
    password = data["password"]
    postID = data["postID"]
    # Create an Instagram object.
    instagram = Instagram()
    # Load the username and password to the instagram object.
    instagram.with_credentials(username, password)
    # Login to the Instagram account.
    instagram.login()
    # Sleep for 4 seconds to prevent Instagram from blocking the request.
    sleep(4)
    # Get the userlist from the postId using instagram object's get_media_likes_by_code(postId) method.
    userlist = instagram.get_media_likes_by_code(postID, 75)
    # Run a FOR loop through the userlist['accounts'] and the get account ID's in a list.
    list = []
    for user in userlist['accounts']:
        list.append(user.identifier)
    # Parse the list to JSON.
    parsedlist = dumps(list)
    names = []
    for name in userlist['accounts']:
        names.append(name.username)
    parsednames = dumps(names)
    # Return the JSON.
    # return json({ parsednames : parsedlist })
    return json({ parsednames : parsedlist })

@app.route("/something")
async def something_handler(request):
    return json({"msg":"Hurray"})

# A Sanic app route using a POST method for getting the userId of the user to follow, with the username as usr and password as pwd.
@app.post("/follow")
def follow_handler(request):
    # Get the data from the request.
    data = loads(request.body)
    # Get the username, password and userId from the data.
    username = data["username"]
    password = data["password"]
    userID = data["userID"]
    # Create an InstagramAPI object.
    api = InstagramAPI(username, password)
    # Login to the Instagram account.
    api.login()
    # Sleep for 4 seconds to prevent Instagram from blocking the request.
    sleep(4)
    # Follow the user using the instagram object's follow_by_id(userId) method.
    api.follow(userID)
    # Return the JSON.
    return json({"message": "Followed user: " + userID})

@app.route('/test', methods=["GET", "POST"])
def test_handler(request):
    return text({"message": "Test exists!"})

# app.add_route(userlist_handler, '/userlist', methods=["POST","GET"])
# app.add_route(follow_handler, '/follow', methods=["POST","GET"])
# app.add_route(test_handler, '/test', methods=["POST","GET"])
