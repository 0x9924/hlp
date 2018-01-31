library(RCurl)
library(XML)

url0 <-
    "https://https://es.wikipedia.org/wiki/Anexo:Pa%C3%ADses_por_desempleo"
html <- getURL(url0)

tables <- readHTMLTable(html)

