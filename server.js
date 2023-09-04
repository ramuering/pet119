const express = require('express');

const app = express();

const port = 3001;

app.set("port", port);

app.get("/", (req, res) => {
  res.send("Hello world!");
});

app.get("/idDoubleCheck", (req,res) => {
  res.sendFile("./server_api/idDoubleCheck.js");
})

app.listen(port, () => console.log("Listening on", port));

module.exports = app;

