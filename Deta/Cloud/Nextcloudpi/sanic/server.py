from sanic import Sanic
from sanic.response import json
from sanic.response import text
import ipaddress

app = Sanic("portcheck")

@app.get("/")
async def test(request):
    return text("Hello")

@app.post("/post_test")
async def post_test(request):
    data = request.json
    headers = request.headers
    host = headers['host'].rsplit(":")
    print(headers)
    print(host[0])
    return json({"hello":data})


if __name__ == '__main__':
    app.run(host="0.0.0.0", fast=True)
