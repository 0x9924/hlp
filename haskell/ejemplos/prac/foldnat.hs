foldnat :: (b -> b) -> b -> Int -> b
foldnat s z 0 = z
foldnat s z n = s (foldnat s z (n -1 ))
