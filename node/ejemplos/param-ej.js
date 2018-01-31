const param2 = process.argv[2];

function hacer_url (str) {
    if ( str.match (/^http/)) {
	return str;
    } else if ( str.match (/^www/)) {
	return  "http://" + str;
    } else
	return "http://www." + str;
}

if (param2 === undefined) {
    console.error("Debe proveer argumento."); process.exit(1);
} else
    console.log (hacer_url (param2));
