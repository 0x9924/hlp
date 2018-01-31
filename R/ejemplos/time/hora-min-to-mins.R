hmtoms <- function (hms) {
    stopifnot (identical (typeof (hms), typeof(character())))
    sapply(hms,
           function (hm) {
                   hm <- unlist (strsplit (hm, ":"))
                   h <- as.integer(hm[1]) * 60
                   m <- as.integer(hm[2])
                   h + m

           })
}

