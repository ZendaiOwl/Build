#!/usr/bin/env node
/**
var http = require('http');
var server = http.createServer(function(req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    var message = 'It works!\n',
        version = 'NodeJS ' + process.versions.node + '\n',
        response = [message, version].join('\n');
    res.end(response);
});
server.listen();
*/
require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
const nodePortScanner = require('node-port-scanner');

app.use(express.json());
app.use(cors({ origin: process.env.REMOTE_CLIENT_APP, credentials: true }));

app.get('/', (req, res) => res.send('Hello, whomever is looking at this page!'));

app.post('/portcheck', async (req, res) => {
  const ip = req.body.key;
  nodePortScanner(ip, [80, 443])
  .then(results => {
    res.send(results);
  })
  .catch(error => {
    res.send(error);
  });
});

// export 'app'
//module.exports = app
app.listen();
