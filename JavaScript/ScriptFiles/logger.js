#!/usr/bin/env node
const args = process.argv
const nodePath = args.shift()
const scriptName = args.shift()
const lvl = args.shift()
function log(level, text) {
  const reset = '\x1b[0m'
  const colors = {
    e: '\x1b[31m%s\x1b[0m',
    w: '\x1b[33m%s\x1b[0m',
    s: '\x1b[32m%s\x1b[0m',
    i: '\x1b[34m%s\x1b[0m',
    d: '\x1b[36m%s\x1b[0m'
  }
  const prefix = {
    e: 'ERROR',
    w: 'WARNING',
    s: 'SUCCESS',
    i: 'INFO',
    d: 'DEBUG'
  }
  let string = getString(text)
  console.log(colors[level], prefix[level] + reset, string)
}
function getString(inputTxt) {
  let input = [inputTxt]
  let output = ""
  input.forEach(txt => {
    output += txt + " "
  })
  return output
}
const helpMessage = {
  1: "Required args: [LOG LEVEL] Can be digit or letter. [MESSAGE] The message to log",
  2: "[LOG LEVEL] Available options are: [debug|d|-2], [info|i|-1], [success|s|0], [warning|w|1], [error|e|2]",
  3: "Display this help message: [help|h|3]"
}
function error(message) { log('e', message) }
function warning(message) { log('w', message) }
function success(message) { log('s', message) }
function info(message) { log('i', message) }
function debug(message) { log('d', message) }
function help() { 
  let message = getString(helpMessage) 
  info(message) 
}
if (lvl == null) {
  error("Insufficient arguments, requires [LOG LEVEL] and a [MESSAGE] argument(s) to log.")
  info("[LOG LEVEL]: [c|3], [w|2], [s|1], [i|0], [d|-1] can be used")
} else if (lvl != null && args.length == 0) {
  log('i', 'Insufficient arguments, requires a MESSAGE argument(s) to log.')
} else {
  switch (lvl) {
    case 3:
    case 'h':
    case 'help':
      help()
      break;
    case 2:
    case 'e':
    case 'error':
      let message = getString(args)
      error(message)
      break;
    case 1:
    case 'w':
    case 'warning':
      let message = getString(args)
      warning(message)
      break;
    case 0:
    case 's':
    case 'success':
      let message = getString(args)
      success(message)
      break;
    case -1:
    case 'i':
    case 'info':
      let message = getString(args)
      info(message)
      break;
    case -2:
    case 'd':
    case 'debug':
      let message = getString(args)
      debug(message)
      break;
    default:
      error("Unknown LOG LEVEL")
      help()
      break;
  }
}
