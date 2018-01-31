fsoporte <- function(foo, condf)
{
    function(x)
    {
        as.numeric(condf(x)) * foo(x)
    }
}

indicadoras <- function(...)
{
    foos <- list(...)
    function(x)
    {
        sapply(foos, function(f) f(x))
    }
        
}
