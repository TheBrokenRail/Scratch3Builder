var path = require('path');
var connect = require('connect');
var serveStatic = require('serve-static');
var server = connect().use(serveStatic(path.join(__dirname, 'editor')));
server.listen(8080, function(){
  console.log('Server running on 8080...');
});
