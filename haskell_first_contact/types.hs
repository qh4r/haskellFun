test :: [Integer]  -- Int ma taki zakres jak Int32 w cpp, Integer - ma nieograniczony zakres liczbowy
test = [23,23,52]

funTest :: Integer -> Integer -> Integer -- funkcja przyjmujaca 2x int i zwracajaca int

-- tak naprawde wszysktkie funkcje w haskelu sa rozwijane i przyjmuja 1 argument zwracajac reszte, to obrazuje ten typ funTest
-- dzieki temut ez dziala partial applience
funTest = (\ x y -> x * y);

funResult = map (funTest $ 2) test

-- generalnie zazwyczaj mamy doczynienia z inferencja i nie musimy typowac

funAnyTest :: Num a => [a] -> a

funAnyTest = foldl (*) 1

anyRes = funAnyTest [3.24, 4, 2.4]

-- a to dowolna lista
someList :: Num a => [a]
someList = []

-- typy (a) zawsze z malej litery, klasy konketne z duzej (Int, Double, Char]


-- na lewo od => jest constraint na typy!!

customLength :: Show s => [s] -> Int

customLength text = length text

lengthRes = customLength "Krol Karol kupil krolowej Karolinie.."

-- a ma 2 constrainty
showSum :: (Num a, Show a) => [a] ->  [Char]

showSum text = show (sum text)

-- SYNONIM TYPU
type Point = (Double, Double)

calculateDistance ::  Point -> Point -> Double

calculateDistance a b =
      sqrt (
          (let x = (fst a) - (fst b)
          in x**2) +
          (let y = (snd a) - (snd b)
          in y**2)
          )

distance = calculateDistance (2.0, 5.3) (7.8, (-2.1))

-- NEWTYPE

-- newtype NAZWA = KONSTURUKTOR TYP_REPREZENTACJI

newtype CarId = MakeId Int
newId = MakeId 15 -- musimy uzyc konstruktora -- taki typ np nie bedzie dodawalny do innych intow

-- RECORDS

-- deklaracja
data Car = MakeCar
  {
      carId :: CarId
    , name :: String
    , age :: Int
  }

-- instancjonowanie
sampleCar = MakeCar
  {
      carId = MakeId 23
    , name = "Audi"
    , age = 9
  }

-- odwolywanie sie  do pol
carName = name sampleCar
carAge = age sampleCar

-- tworzenie instancji na bazie innych
-- nie da sie zmienic wartosci instancji - tworzy sie nowa z uzyciem danych poprzedniej, stara zostaje bez zmian
otherCar = sampleCar {name = "Toyota", carId = MakeId 124}

-- NAZWY POL MUSZA BYC UNIKALNE DLA WSZYSTKI!!!! REKORDOW
-- NP NIE MOZNA STWORZYC INNEGO REKORDU POSIADAJACEGO NAME, GDY ISTNIEJE POWYZSZY TYP CAR

-- algebraic types

-- TUTAJ BARDZO WAZNE BY KONSTRUKTOR (1 ARGUMENT) MIAL TAKA SAMA NAZWE JAK TWORZONY TYP -- inaczej nie działa dekompozycja
data Person = Person String String Int
samplePerson :: Person
samplePerson = Person "Rafal" "Makowiak" 23
getPersonSurname :: Person -> String
getPersonSurname (Person _ surname _ ) = surname -- _ dopasowywuje wszystki (dziala jak w jsie)
sampleSurname = getPersonSurname samplePerson

-- ta jest zadeklarowany Bool w haskelu
data Bool' = False | True
-- | daje mozliwosc zadeklarownaia >1 kosntruktora

-- BTW w haskelu nie ma czegos takiego jak null

data MaybeInt = NoInt | JustInt Int -- to powoduje ze MabeyInt przyjmuje albo NoInt (tak jak enum) albo JustInt z liczbą jako parametrem
defaultInt :: Int -> MaybeInt -> Int
defaultInt defaultValue NoInt = defaultValue
defaultInt _ (JustInt x) = x

--np
ttest = defaultInt 12 (JustInt 32) -- zwraca 32
ttest2 = defaultInt 12 NoInt -- zwraca 12

-- ZASADNICZO MOZNA O TYM MSYLEC JAKO O ENUMIE KTORY MOZNA PARAMETRYZOWAC

--typy tak deklarowane moga byc generyczne

data Maybe a = Just a | Null

-- musimy uzyc Main, bo kompilator obawiasie konfliktu z Prelude.Maybe
x :: Main.Maybe Int
x = Null