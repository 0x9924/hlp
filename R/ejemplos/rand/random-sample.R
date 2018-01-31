cantidad <- 99999999
n <- 16 
cat("n = ", n, "\ncantidad = ", cantidad, "\n")
x <- sample(x=0:(n-1),size=cantidad,replace=TRUE)
tabla <- t(t(table(x)))
print(tabla)
print(sum(tabla))
