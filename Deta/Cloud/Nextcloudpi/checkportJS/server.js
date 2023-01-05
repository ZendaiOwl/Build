#!/usr/bin/env node
const http = require('http');
const net = require('net');
const server = http.createServer(async (req, res) => {
  if (req.url === "/" && req.method === "GET") {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.write("Hello there, this is a custom HTTP server test-demo");
    res.end();
  } else if (req.url === "/test" && req.method === "GET") {
    res.writeHead(200, {"Content-Type": "application/json"});
    res.write(JSON.stringify({ message: "Hi there, This is a Vanilla Node.js API" }));
    res.end();
  } else if (req.url === "/port" && req.method === "GET") {
      res.writeHead(200, {"Content-Type": "application/json"});
      let host = "ipv6.google.com";
      let socket = new net.Socket();
      let timeout = 200;
      let family = 6;
      let remoteFamily = "IPv6";
      let host = "ipv6.google.com";
      let port = 80;
      socket.setTimeout(timeout);
      socket.remotePort(port);
      socket.remoteFamily(remoteFamily);
      try {
        socket.connect(port, host);
        var success = true;
        socket.close();
      } catch (error) {
        console.log(error);
        var success = false;
        socket.close();
      }
      res.end();
  } else {
    res.writeHead(404, {"Content-Type": "application/json"});
    res.end(JSON.stringify({ message: "Route not found" }));
  }
});

server.listen();

socket.connect(port, host, () => {
  res.write("Open");
});

async checkPort(address, port) {
  return new Promise(resolve => {
    let socket = net.createConnection({host: address, port: port, timeout: 1000}, () => {
      client.end();
      resolve(true);
    });
    client.on("error", () => {
      resolve(false);
    });
  });
}

const ip = res.socket.remoteAddress;
const port = res.socket.remotePort;
res.write(`IP ${ip}, Port ${port}`);
res.end(`IP ${ip}, Port ${port}`);


      let host = "ipv6.google.com";
      let socket = new net.Socket();
      let timeout = 200;
      let family = 6;
      let remoteFamily = "IPv6";
      let host = "google.com";
      let port = 80;
      socket.connect(port, host, () => {
          res.write(JSON.stringify({ message: "Open"}));
      });
