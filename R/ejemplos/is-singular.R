is.singular <- function(x) {
    tryCatch(!is(Matrix::lu(x, warnSign=FALSE, errSign=TRUE), "LU"),
             error=function(.) TRUE )
}


is.singular2 <- function(x) {
    !is(try(Matrix::lu(x, warnSign=FALSE, errSign=TRUE),
        silent = TRUE), "LU")
}
