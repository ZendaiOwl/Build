#!/usr/bin/env node

import http from 'http'

let server = {}
let routes = []
let plugins = []

function errorTemplate (request, response) {
  return response.json({
    error: request.url + ' not found.'
  })
}

function createServer (port, options, handler) {
  return http.createServer(options, handler).listen(port)
}

function responseFunctions (response) {
  return {
    send (value) {
      return response.end(value)
    },

    status (code) {
      return response.writeHead(code)
    },

    setHeader (name, value) {
      return response.setHeader(name, value)
    },

    json (value) {
      response.setHeader('Content-Type', 'application/json')
      response.end(JSON.stringify(value))
    },

    html (value) {
      response.setHeader('Content-Type', 'text/html')
      response.end(value)
    },

    css (value) {
      response.setHeader('Content-Type', 'text/css')
      response.end(value)
    }
  }
}

function lookupRoute (url) {
  for (let i = 0; i < routes.length; i++) {
    let params = routes[i].route.match(url)

    if (params) {
      return [params, routes[i]]
    }
  }

  return [undefined, undefined]
}

function routeHandler (request, response, error) {
  const [url, query] = request.url.split('?')
  const [params, route] = lookupRoute(url)

  let index = 0

  if (
    params === undefined ||
    route === undefined ||
    request.method !== route.method
  ) {
    error(request, responseFunctions(response))
    return
  }

  request.params = params

  const baseURL = 'http://' + request.headers.host + '/'
  const parsedURL = new URL(request.url, baseURL)

  request.query = Object.fromEntries(parsedURL.searchParams)

  function activator (request, response) {
    return plugins[index](request, response, () => { 
      index++

      if (index < plugins.length) {
        activator(request, response)
      } else {
        route.handler(request, responseFunctions(response))
      }
    })
  }

  plugins.length !== 0
    ? activator(request, response)
    : route.handler(request, responseFunctions(response))
}

for (let method of http.METHODS) {
  server[method.toLowerCase()] = (route, handler) => {
    routes.push({ 
      method, 
      handler, 
      route: route
    })
  }
}


      const connectToPort = (host, port, callback) => {
      // error checking args
      if (!Number.isInteger(port)) reject({ 'error' : 'port must be an integer' });
      if (port < 1 || port > 65535) reject({ 'error' : 'port must be in range [1-65535]' });
      
      let socket = new net.Socket();
      // increase this if y'all on dial up
      let timeout = 200;
      
      // new properties & events for port scanner
      socket._scan = {};
      socket._scan.status = 'initialized';
      socket._scan.host = host;
      socket._scan.port = port;
      socket._scan._events = { complete : callback };
      
      // events for socket
      socket.on('connect', function () {
        this._scan.status = 'connect';
        socket.destroy();
      });
      socket.on('timeout', function () {
        this._scan.status = 'timeout';
        socket.destroy();
      });
      socket.on('error', function (exception) {
        this._scan.status = 'error';
        socket.destroy();
      });
      socket.on('close', function (exception) {
        this._scan._events.complete(this._scan);
      });
      
      socket.setTimeout(timeout);
      socket.connect(port, host);
      };
server.use = middelware => {
  return (typeof middelware === 'function')
    ? plugins.push(middelware)
    : undefined
}

server.listen = (
  port = 3000, 
  options = undefined, 
  error = errorTemplate
) => {
  return (routes && routes.length !== 0) 
    ? createServer(port, options, (request, response) => routeHandler(request, response, error)) 
    : undefined
}

export default server






/////

import server from './server.js'

server.get('/', (request, response) => {
  response.send('hello')
})

server.listen(3000)
