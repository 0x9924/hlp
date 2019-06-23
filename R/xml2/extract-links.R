html_extract_links <- function(url) {
  doc <- read_html(url)
  unique(sapply(xml_find_all(xml_find_all(doc, "//a"), "@href"), xml_text)
}
