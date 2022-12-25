#!/usr/bin/env node
/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const args = process.argv
const nodePath = args.shift()
const scriptName = args.shift()
const error = '\x1b[0;31mERROR\x1b[0m:'
const space = " "
if (args != 0) {
  logText = ""
  args.forEach(txt => {
    logText += txt + space
  })
  console.log(error, logText)
} else {
  console.log("No arguments")
}
