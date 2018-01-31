"use strict"; 
const fs = require ("fs"),
      spawn = require ("child_process").spawn,
      filename = process.argv[2];

if (!filename) {
    console.log("A file to watch must be specified!");
} else if (!fs.existsSync(filename)) {
    console.log(filename + " does not exists!");
} else {
    fs.watch(filename, function () {
	let ls = spawn("ls", ["-lh", filename]), out = [];
	ls.stdout.on("data", function(chunk) {  out.push(chunk); });
	ls.on("close", function () {
	    out.forEach(function(e) { console.log(e.toString()); });
	});
    });
    console.log("Now watching " + filename + " for changes...");
}
