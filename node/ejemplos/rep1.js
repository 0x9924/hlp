var http = require('http');
var fetch = require('node-fetch');

var pagina;
const url = process.argv[2];

if (url != undefined) {
    console.log("http://www."+ url);

    fetch("http://www." + url)
        .then(function(res) {
            return res.text();
        }).then(function(body) {
            pagina = body;
        });

    var server = http.createServer(function (request, response) {
        //response.writeHead(200, {"Content-Type": "text/plain"});
        response.end (pagina);
    });
    server.listen(8000);
    console.log("Server running at http://127.0.0.1:8000/");
} else {
    console.log("Debe decir el nombre");
}
