grabLine :: IO String  -- sparametryzwane io -- przyjmowany string poza nawiasem
grabLine = getLine

readAndRepeat :: IO()
readAndRepeat = do
                line <- getLine -- czyta 1 linie
                putStrLn "jeszcze 1"
                line2 <- grabLine
                putStrLn ("Twoja linia: "++ line ++ " i druga \n" ++ line2)

mergeLines :: IO(String) -- zwracabt string jest w nawiasie
mergeLines = do
              putStrLn "poda 1 linie"
              line1 <- getLine
              putStrLn "poda 2 linie"
              line2 <- getLine
              return (line1 ++ "\n" ++ line2)


main = do
      putStrLn "No cześć"
      readAndRepeat
      resultLine <- mergeLines
      let fun = resultLine ++ "\nupgrade"
      putStrLn fun

      -- istnieja funkcje readFile i writeFile do zapisu i odczytu plikow