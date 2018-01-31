var http = require('http');
var fetch = require('node-fetch');
var url = require('url');
var pagina;


function hacer_url (str) {
    if (str.match (/^http:\/\//)) return str;
    else if (str.match (/www\./)) return "http://" + str;
    else return "http://www." + str;
}


if (process.argv[2] == undefined) {
    console.log("Debe decir el nombre");
    process.exit(1);
}

const baseurl = hacer_url (process.argv[2]);

function onRequest (request, response) {
    var pathname = url.parse (request.url).pathname;
    console.log ("Se hizo request ``%s''.", pathname);
    fetch(baseurl + pathname)
        .then(function(res) { return res.text(); })
        .then(function(body) { response.end(body); });
}



console.log("Buscando " + baseurl + " ...");
console.log("Server running at http://127.0.0.1:8000/");
http.createServer (onRequest).listen(8000);
