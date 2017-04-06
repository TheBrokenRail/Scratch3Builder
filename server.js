var path = require('path');
var connect = require('connect');
var serveStatic = require('serve-static');
var port = require('./port.js');
module.exports = port;
var server = connect().use(serveStatic(path.join(__dirname, 'editor')));
server.listen(port, function(){
  console.log('Server running on ' + port + '...');
});
