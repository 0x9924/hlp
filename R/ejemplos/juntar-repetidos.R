## Esta funcion toma un data frame que puede tener repetidos en su primer
## columna y devuelve un data frame con la misma data, pero que no tiene
## repetidos en la primer columna, y en la segunda se 'juntan' las que
## había en pre(dj)


sinRepetidos <- function(df) {
    res <- as.data.frame(df[1,])
    repes <- 0
    norepes <- 0
    for (i in 2:dim(df)[1]) {
        repetido <- FALSE
        for (j in 1:dim(res)[1]) {

            if (res[j,1] == df[i,1]) {

                res[j,2] <- paste (res[j, 2], df[i, 2], sep="; ")
                print(res[j,2])
                repetido <- TRUE
                break
            }
        }

        if (repetido) {
            repes <- repes + 1
            next
        } else {
            norepes <- 1 + norepes
            res <- rbind(res, c(df[i,1], df[i,2]))
        }


    }
    print (norepes)
    print (repes)
    res
}
