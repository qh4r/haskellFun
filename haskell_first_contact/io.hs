-- trzeba kompilowac przy uzyciu ghc zamiast ghci
hi :: IO()
hi = putStrLn "Hello World"
-- to tak naparwde swego rodzaju partial appliance
-- print dopiero nastapi po wywolaniu hi

-- IO action to typ ktory zostanie wykonany dopiero w srodowisku

sayHi :: String -> IO()
sayHi name = do
              putStrLn (name ++ " says hi")
              putStrLn "And walks away"

main :: IO()
main = do
            putStrLn "HI \n hey"
            hi
            hi
            hi
            putStrLn "!!!"
            sayHi "Marcin"

-- MIAN MUSI BYC ZADEKLAROWANE by dalo sie skompilowac i to wlasnie main bedzie punktem wejscia programu