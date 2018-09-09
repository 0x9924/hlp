longitud :: [a] -> Int
longitud xs = foldr (1+) 0 xs
