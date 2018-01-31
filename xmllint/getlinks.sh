FILE=${1}
xmllint --html --xpath '//a/@href' ${FILE} |\
     sed 's/href=/\n/g' |\
     tr -d \" |\
     sort -u
