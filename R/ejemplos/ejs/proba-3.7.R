f1 <- function(x) x/25
f2 <- function(x) 2/5 - x/25


mto <- function(n, foo, desde=-Inf, hasta=Inf)
{
    integrate(function(x)
        x**n * foo(x),
        desde, hasta)$value
}

fy <- function(x)
{
    If <- function(x) 
        c(as.numeric(0 < x && x < 5),
          as.numeric(5 < x && x < 10))
    I <- sapply(x, If)
    I[1,] *  (x / 25) + I[2,] * (2/5 - x/25) 
}

fz <- function(x)
{
    fy(1/x)/x**2
}

## b)
cat(paste("E[Y] =", mto(1,fy), "\n"))
cat(paste("V(Y) =", mto(2,fy) - mto(1,fy)**2, "\n"))
## b)
cat(paste("E[1/Y] =", mto(1, fz, .1), "\n"))


