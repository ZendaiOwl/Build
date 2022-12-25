#!/usr/bin/env node
/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const args = process.argv;
const nodePath = args.shift()
const scriptName = args.shift()
function showArgs() {
  console.log('Number of arguments: ' + args.length)
  args.forEach((val, index) => {
    console.log(`${index}: ${val}`)
  });
}
showArgs();
