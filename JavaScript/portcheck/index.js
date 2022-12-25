const express = require('express');
const app = express();
const net = require('net');
const ports = [80,443,8080,8443]
app.use(express.json());

app.get('/', (req, res) => res.send('Hello, whomever is looking at this page!'));

app.post('/check', async (req, res) => {
  const ip = req.body.key;
  let http = await checkPort(ip, ports[0])
  let https = await checkPort(ip, ports[1])
  let message = {
    '80': http,
    '443': https
  }
  res.send(message)
});

async function checkPort(address, port) {
  return new Promise(resolve => {
    let socket = net.createConnection({host: address, port: port, timeout: 100})
    socket.on("error", () => {
      socket.end()
      resolve("closed")
    });
    socket.on("connect", () => {
        socket.end()
        resolve("open")
    });
  });
}
// export 'app'
module.exports = app

