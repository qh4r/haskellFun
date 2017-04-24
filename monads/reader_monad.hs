import Control.Monad.Reader

--data Reader contextValue resultOfReaderComputation
-- class type:
-- instance Monad (Reader r)
-- obsluguje funkcje:
-- ask :: Reader r r
-- runReader :: Reader r a -> r -> a

getPartOne :: Reader String String
getPartOne = do
    name <- ask
    return ("Zrob pranie : " ++ name);

getPartTwo :: Reader String String
getPartTwo = do
    name <- ask
    return ("Umyj buty: " ++ name);

getStory :: Reader String String
getStory = do
    first <- getPartOne
    second <- getPartTwo
    return ("1) " ++ first ++ "\n2) " ++ second)

output = runReader getStory "Ryszard" -- zwraca string z monad
