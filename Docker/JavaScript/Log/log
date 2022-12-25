#!/usr/bin/env node
/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const args = process.argv
const nodePath = args.shift()
const scriptName = args.shift()
const logLevel = args.shift()
const space = " "
const colors = {
  e: '\x1b[31m%s\x1b[0m:',
  w: '\x1b[33m%s\x1b[0m:',
  s: '\x1b[32m%s\x1b[0m:',
  i: '\x1b[34m%s\x1b[0m:',
  d: '\x1b[36m%s\x1b[0m:'
}
const levels = {
  e: 'ERROR',
  w: 'WARNING',
  s: 'SUCCESS',
  i: 'INFO',
  d: 'DEBUG'
}
const logLevels = ['e','w','s','i','d']
function getLogOutput(level, text) {
  return console.log(colors[level], levels[level], text)
}
function getLogObject() {
  let value = {}
  Object.keys(levels).forEach(level => {
    value[level] = text => getLogOutput(level, text)
  })
  return value
}
const log = getLogObject()
if (logLevel != null && args.length > 0) {
  let input = ""
  args.forEach(text => {
    input += text + space
  })
  switch (logLevel) {
    case logLevels[0]:
      log.e(input)
      break;
    case logLevels[1]:
      log.w(input)
      break;
    case logLevels[2]:
      log.s(input)
      break;
    case logLevels[3]:
      log.i(input)
      break;
    case logLevels[4]:
      log.d(input)
      break;
    default:
      console.log("ERROR")
      break;
  }
} else {
  log.e("No arguments")
}
