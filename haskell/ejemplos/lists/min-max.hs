maximo0 :: Ord a => [a] -> a

maximo0 (x:[]) = x
maximo0 (x:xs) = if x > y then x else y
  where y = maximo0 xs

minimo0 :: Ord a => [a] -> a

minimo0 (x:[]) = x
minimo0 (x:xs) = if x < y then x else y
  where y = minimo0 xs


listaMasCorta0 l = minimo0 l

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun foo (x:[])  = x
mejorSegun foo (x:xs)  = if foo x y then x else y
  where y =  mejorSegun foo xs

maximo1 l = mejorSegun (>) l
minimo1 l = mejorSegun (<) l

listaMasCorta1 l = minimo1 l
