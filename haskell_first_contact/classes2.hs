
class (Eq a, Show a) => ShowEq a where
  (==) :: a -> a -> Bool
  show :: a -> String


data Test = Test String
  deriving (Show, Eq)

instance ShowEq Test where
    (Test x) == (Test y) = x Prelude.== y
    show (Test x) = "NOWY TYP O WARTOSCI: " ++ Prelude.show x

test = Test "Niezapominajka"

eqTest = test Main.== (Test "Niezapominajka")
-- Main odnosi sie do tego co ejst deklarowane tutaj
-- Prelude.show test zwroci - "Test \"Niezapominajka\""
-- Main.show test zwroci - "NOWY TYP O WARTOSCI: \"Niezapominajka\""

-- pojebane sa te namespacy Prelude i Mian gryza sie