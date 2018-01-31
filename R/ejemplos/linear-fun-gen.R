## Con sample.var generamos una matriz de dim == nargs x nvars que
## representa nvars funciones lineales sobre los nargs factores.

## sample.facts es una matriz de ncasos x nfacts que representa
## los puntajes de ncasos sujetos en nfacts factores

## crear.matriz realiza el producto matricial y devuelve una
## data.frame que representa los puntajes de dim(factores)[1] sujetos
## en dim(var.coefs)[2] variables.

sample.var <- function(nvars=40, nargs= 3, min=-1, max=1, coefs.len=100)
{
    dominio <- seq(from=min, to=max, by=(max - min)/coefs.len)
    datos <- sample(x=dominio, size=nvars * nargs, replace=TRUE)
    matrix(datos , nrow=nargs)
##    data.frame(datos.matrix)
}

sample.facts <- function(nfacts=3, ncasos=100, min=0, max=10, nvals=50)
{
    dominio <- seq(from=min, to=max, by=(max - min)/nvals)
    datos <- sample(x=dominio, size=ncasos * nfacts, replace=TRUE)
    matrix(datos , ncol=nfacts)
##    data.frame(datos.matrix)
}


crear.matriz <- function(factores, var.coefs, digits=3)
{
    df <- data.frame(factores %*% var.coefs)
    df <- round(df, digits)
    colnames(df) <- paste ("V", 1:dim(var.coefs)[2], sep="")
    df
}
