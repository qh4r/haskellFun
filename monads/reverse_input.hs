
bindIO :: IO(a) -> (a -> b) -> IO(b) -- funkcja ktora bierze io a, rozpakowywuje je tak by pracowac na a, i wytwarza przetworzone IO (oznaczone jako b)
bindIO io fun = do
                  line <- io
                  return (fun line)

main = do
        putStrLn "napisz cos"
        line <- bindIO getLine (\x -> reverse x)
        putStrLn line
