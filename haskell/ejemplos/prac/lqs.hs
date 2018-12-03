lqs :: Int -> [[Int]]

lqs 0 = [[]]
lqs n = [xs | k <- [1..n], xs <- map (k:) (lqs (n - k)) ]
