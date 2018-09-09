shuffle0 [] ll = []
shuffle0 (x:xs) ll = ll !! x : shuffle xs ll


losIesimos :: [Int] -> [[a] -> a]
losIesimos xs = map (flip (!!)) xs

shuffle :: [Int] -> [a] -> [a]
shuffle indxs l = map (flip ($) l) (losIesimos indxs)
