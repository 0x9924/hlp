library(quantmod)

get_dividends_by_year <- function (NAME) {
    data <- getDividends(NAME)
    years <- format(index(data), "%Y")
    aggregate(data, by=list(years), sum)
}

dividends_by_year <- function (NAME) { UseMethod("dividends_by_year") }
dividends_by_year.character <- function (NAME) {
    dividends <- getDividends(NAME)
    prices <- getSymbols(NAME, auto.assign=FALSE)
    prices <- prices[index(dividends)]
    dividends <- dividends[index(prices)]
    percentage <- dividends / Cl(prices)

    div.close <- cbind(dividends, percentage)
    years <- format(index(dividends), "%Y")
    
    res <- aggregate(div.close, by=list(years), sum)
    res 
}
