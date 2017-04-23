flatMap :: [a] -> (a -> [b]) -> [b]
flatMap list action = foldl (++) [] (map action list)

flatmapTest = flatMap [1,4,8] (\x -> [x * 2, x* 3, x* 4])