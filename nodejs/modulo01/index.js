const express = require('express');

const server = express();

server.get('/ping', (req, res) => {
  return res.send({message: "PONG"});
})

server.listen(8080);
