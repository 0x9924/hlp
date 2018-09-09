prodNonCurry :: (Int, Int) -> Int
prodNonCurry (x, y) = x * y

prodCurry :: Int -> (Int -> Int)
(prodCurry x) y = x * y


curry :: ((a, b) -> c) -> (a -> (b -> c))
curry foo x y = foo (x, y)


uncurry ::  (a -> (b -> c)) -> ((a, b) -> c)
uncurry foo (x, y) = foo x y

