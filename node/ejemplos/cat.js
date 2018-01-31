"use strict"; 
const fs = require ("fs"),
      spawn = require ("child_process").spawn,
      filename = process.argv[2];

if (!filename) {
    console.log("A file to watch must be specified!");
} else {
    fs.readFile(filename, function(err, data) {
	if (err) { throw err; }
	console.log(data.toString());
    });
}
