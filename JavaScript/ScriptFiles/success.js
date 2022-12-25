#!/usr/bin/env node
/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const args = process.argv
const nodePath = args.shift()
const scriptName = args.shift()
const success = '\x1b[32mSUCCESS\x1b[0m:'
const space = " "
if (args != 0) {
  logText = ""
  args.forEach(txt => {
    logText += txt + space
  })
  console.log(success, logText)
} else {
  console.log("No arguments")
}
