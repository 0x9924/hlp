
takeN n = if n == 0 then (const [])
          else (\l -> if null l then []
                      else (head l): ( takeN (n-1) (tail l)))

takeNf n = if n == 0 then (const [])
          else foldr (\a b -> a : takeNf (n-1) b) []

tk0 [] = (const [])
tk0 (x:xs) = (\n -> if n == 0 then []
                    else x : tk0 xs (n-1))


tk1 :: [a] -> Int -> [a]
tk1 = foldr (\a b ->
                (\n -> if n == 0 then  []
                       else a : b (n-1)))
      (const [])
