is.positive.definite <- function(x) {
    tryCatch(is.matrix(chol(x)), error=function(.)FALSE)
}

is.positive.definite2 <- function(x) {
    is.matrix(try(chol(x), silent = TRUE))
}
