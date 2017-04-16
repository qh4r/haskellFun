-- tak naprawde to klasy typow - troche jak interfejsy

--- szukanie elementu w liscie
hasAny :: Eq a => a -> [a] -> Bool -- klasa typow Eq okresla mozliwosc przyrownania ==
hasAny _ [] = False
hasAny x (current: rest)
  | x == current  = True
  | otherwise     = hasAny x rest

anyResult = hasAny 1 [2,41,25,3,123,422,1,4]

data RGB = RGB Int Int Int
  -- w taki sposob dodajemy mozliwosc uzycia == na klasie!!
instance Eq RGB where
  (RGB r1 g1 b1) == (RGB r2 g2 b2) = (r1 == r2) && (g1 == g2) && (b1 == b2)
  -- musimy zadeklarowac wszystkie funkcje wymagane przez klase typow (Eq wymaga tylko ==)

instance Show RGB where
  show (RGB r g b) = "Kolor RGB: R: " ++ (show r) ++ ", G: " ++ (show g) ++ " ,B: " ++ (show b)

sampleRgb = (RGB 12 140 16)
rgbRes = (RGB 12 140 16) == sampleRgb

-- da sie to uproscic
 -- deriving XXX umozliwia latwe dodanie domyslnych funkcji wymaganych przez kalse typow
data Point = Point Double Double
  deriving (Eq, Show)
-- dziala!
samplePoint = Point 23.53 (-231.21)
pointEquality = samplePoint == (Point 23.53 (-231.21))

-- deriving dziala dla Eq, Ord (wieksze mniejsze), Show, Read (string w value)
-- nie mozna derivowac Eq i Ord dla funkcji

-- typ klas Eq wyglada dokladnie tak
--class Eq' a where
--  (==) :: a -> a -> Bool
--  (/=) :: a -> a -> Bool
--
---- domyslne implementacje - dzieki temu ze istnieja mozna zadeklarowac tylko 1 z nich
---- a kompilator uzyje jej negacji jako deklaracji drugiego porownania
--  x /= y =  not (x == y)
--  x == y =  not (x /= y)

  -- tak utworzona klase mozna instancjonowac w typie tak jak powyzej, ale nie dziala deriving
  -- minimmum complete definition - to minimalny zestaw funkcji ktore typ musi deklarowac


class Measurable a where
  distance :: a -> a -> Double

data Point3 = Point3 Double Double Double
instance Measurable Point3 where
  distance (Point3 x1 y1 z1) (Point3 x2 y2 z2) =
    sqrt (dx * dx + dy * dy + dz * dz)
      where
        dx = x1 - x2
        dy = y1 - y2
        dz = z1 - z2


point1 = Point3 2.31 4.23 41.2
point2 = Point3 4.3 5.21 30.32
distance12 = distance point1 point2

-- Ord to podtyp Eq (kazdy typ Ord musi nalezec do Eq - implementowac jego metody)


