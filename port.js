var op = require('openport');

// find an open port
var finished = false;
op.find(function(err, port) {
  if (err) {
    console.log(err);
    module.exports = 8080;
    finished = true;
    return;
  }
  module.exports = port;
  finished = true;
});
while (!finished) {}
