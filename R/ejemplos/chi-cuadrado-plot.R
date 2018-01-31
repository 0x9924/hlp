plot.chi2 <- function(df=6)
{
    curve(dchisq(x, df=df),
          col='red',
          main = "Chi-Square Density Graph",
          from=0,to=60 )

    ## el maximo de esta funcion es df - 2.
    abline(v = df - 2)
}
