## using QR descomposition:
## we want to min x that |Ax - b|

QR <- qr(A)
qr.solve(QR, b)

Q <- qr.Q(QR)
R <- qr.R(QR)
c <- t(Q) %*% b

qr.solve(QR, b)
