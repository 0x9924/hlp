DIR="..."

printf "\n\nconnectionString:"

xmllint.exe --xpath //add/@connectionString \
    DIR/WebApi/Web.config \
    | tr -s "\";" "\n" | tr -s "=" "\t"
xmllint --html --xpath '//a/@href' file.html
