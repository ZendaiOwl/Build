#!/usr/bin/env node
/* Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const args = process.argv
const nodePath = args.shift()
const scriptName = args.shift()
const logLevel = args.shift()
const space = " "
const levels = {
  e: '\x1b[31mERROR\x1b[0m:',
  w: '\x1b[33mWARNING\x1b[0m:',
  s: '\x1b[32mSUCCESS\x1b[0m:',
  i: '\x1b[34mINFO\x1b[0m:',
  d: '\x1b[36mDEBUG\x1b[0m:'
}
const logLevels = [
  'e','w','s','i','d',
  3,2,1,0,-1,-2,
  'error','warning','success','info','debug'
]
function getLogOutput(level, text) {
  return console.log(levels[level], text)
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
    case logLevels[5]:
    case loglevel[11]:
      log.e(input)
      break;
    case logLevels[1]:
    case loglevel[6]:
    case loglevel[12]:
      log.w(input)
      break;
    case logLevels[2]:
    case loglevel[7]:
    case loglevel[13]:
      log.s(input)
      break;
    case logLevels[3]:
    case loglevel[8]:
    case logelevel[14]:
      log.i(input)
      break;
    case logLevels[4]:
    case loglevel[9]:
    case logelevel[15]:
      log.d(input)
      break;
    default:
      log.e("ERROR: Unknown LOG LEVEL")
      break;
  }
} else {
  log.e("No arguments")
}
