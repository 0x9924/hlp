## using QR descomposition:
## we want to min x that |Ax - b|

QR <- qr(A)
Q <- qr.Q(QR)
R <- qr.R(QR)
c <- t(Q) %*% b

solve(R,c)
## qr.solve(QR, b)
