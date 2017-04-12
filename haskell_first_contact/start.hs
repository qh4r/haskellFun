-- ghci i :quit - podstawa
var1 = "Hello"
var2 = "World"
hw = var1 ++ " " ++ var2 -- stringi konkatenujemy z uzyciem ++

sq = sqrt 3

--w repl trzeba uzywac LET do deklaracji - w pliku nie

--max wybiera wieksza z 2 liczb
maximum1 = max 2 4 -- 4
maximum2 = max (32 - 43) (sqrt 100) --10
-- NAZWA PARAMETRY = CIALO_FUNKCJI
fun_square x = x * x

-- WCIĘCIA SĄ WAŻNE
ifLargerThenVal x val =
    if x > val
        then 1
        else if x < val
            then -1
            else 0

-- wszystkie funkcje w haskelu sa pure

toPowProto x pow sum =
    if pow == 0
        then sum
        else toPowProto x (pow - 1) (sum * x)

toPositivePow x pow = toPowProto x (abs pow) 1