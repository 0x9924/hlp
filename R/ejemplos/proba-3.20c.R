f <- function(as)
{
    sapply(as,
           function(a)
           {
               integrate(function(x) x**((1/a)-1)/a, 0,1)$value
           })

}


