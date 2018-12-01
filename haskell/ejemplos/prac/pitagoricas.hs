pit = [( a, b , a ^ 2 + b ^ 2) | a <- [1..], b <- [1..a]]


primo p = divisible p 2
divisible p q = if q*q > p then False
                else mod p q == 0 || divisible p (q + 1)

primos = filter primo [1..]

partir [] = []
partir (x:xs)
