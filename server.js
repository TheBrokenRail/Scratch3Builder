var path = require('path');
var connect = require('connect');
var serveStatic = require('serve-static');
var getPort = require('./port.js');
module.exports = function (callback) {
  getPort(function (port) {
    var server = connect().use(serveStatic(path.join(__dirname, 'editor')));
    server.listen(port, function(){
      console.log('Server running on ' + port + '...');
    });
    callback(port);
  });
};
