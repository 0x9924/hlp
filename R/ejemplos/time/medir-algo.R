foo <- function(n) {
    . <- sort(sample(1:n))
}

foo2 <- function(n) {
    m <- matrix(sample(0:999999 / 1000, n * n, replace=TRUE), n)
    . <- solve(m)
    
}

medir <- function(algo, maxn, minn=1,  secs = 1) {
    delta <- Sys.time()
    algo(maxn)
    delta <- as.numeric(Sys.time() - delta)
    veces <- secs / delta
    cat("veces: ", veces, "\t delta: ", delta, "\n")
    enes <- sort(sample(minn:maxn, veces, replace = TRUE))
    foo <- function(n) {
        .delta <- Sys.time()
        algo(n)
        as.numeric(Sys.time()- .delta)
    }
    res <- data.frame(n=enes,t=sapply(enes, foo))
    cat("total time: ", as.numeric(Sys.time() - delta), "\n")
    res
}
    
    
get.fits <- function(datos) {
    n <- datos$n
    data.frame(
        "gr1" = predict(lm(t ~ n, data = datos)),
        "gr2" = predict(lm(t ~ n + I(n^2), data = datos)),
        "gr3" = predict(lm(t ~ n + I(n^2) + I(n^3), data = datos)))
        
}


plotear <- function(datos, fits) {
    plot(datos)
    lines(datos$n, fits[,1])
    lines(datos$n, fits[,2], col = 2)
    lines(datos$n, fits[,3], col = 3)
}
