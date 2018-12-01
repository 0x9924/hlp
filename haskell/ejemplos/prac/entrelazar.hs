entrelazar :: [a] -> [a] -> [a]

entrelazar  = foldr
  (\elem func ->
     (\lista -> if null lista 
                then elem : (func [])
                else elem : (head lista) :
                     (func (tail lista))))
  (\x -> x) 


entrelazar2 :: [a] -> [a] -> [a]

entrelazar2 = foldr
  (\elem ->
     (\func ->
        (\lista -> if null lista 
                   then elem : (func [])
                   else elem : (head lista) :
                        (func (tail lista)))))
  (\x -> x) 


entrelazar3 :: [a] -> [a] -> [a]
entrelazar3 = foldr
  (\a b ->
     (\l -> if null l then a : (b [])
            else a : (head l) : b (tail l)))
  (\x -> x)

