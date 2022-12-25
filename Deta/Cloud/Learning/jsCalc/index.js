// install express with `npm install express` 
const express = require('express');
const app = express(); // instantiate express
app.use(express.json()); // for parsing application/json bodies
const { Base, Drive, Deta } = require('deta');

const deta = Deta('DETA_PROJECT_KEY');
const base = Base('BASE_NAME');
const drive = Drive('DRIVE_NAME');

/** 
	Respond with html file at endpoint
 */
app.get("/", async (req, res) => {
  // res.send('Hello World');
  res.sendFile(__dirname + "/root.html");
});


// export 'app'
module.exports = app;
