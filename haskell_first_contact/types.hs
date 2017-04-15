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