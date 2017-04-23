data Roulette = Red | Green
  deriving (Read) -- konieczne by na type mozna bylo uzyc read

callResult :: Roulette -> String

callResult Red = "Czerwone, to czerwone!"
callResult Green = "Tym razem zielone!"

main = do
        putStrLn "Red or Green"
        line <- getLine
        let parsed = read line -- read parsuje string do enuma!
        putStrLn (callResult parsed)