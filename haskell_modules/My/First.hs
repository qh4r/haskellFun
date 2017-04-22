module My.First ( module DSet -- exportowanie importowanego modułu
                  , funTest -- opcjonalna lista exportow
                  , TestType(TestType)
                  , printSurname) where
import Data.Set as DSet

funTest x = x*x

-- domyslnie wszyskto zadeklarowane w module jest eksportowane ale mozna to ograniczyc lista eksportow

data TestType = TestType String String

printSurname (TestType _ surname ) = surname


-- eksportowac mozna typy finkkcje i konstruktory type classy sa zawsze exportowane