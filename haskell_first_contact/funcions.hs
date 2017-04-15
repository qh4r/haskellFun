import Data.Char -- by moc uzywac toUpper i  toLower

add2 f = f + 2

mult5 f = f * 5

higherOrderResult = add2 (mult5 3)


-- PARTIAL APPLICATION

-- funkcje wywolane z zbyt mala iloscia argumentow tworza funkcje przyjmujace mniej argumentow

sumABC a b c = a + b + c

-- NIE DEKLARUJEMY NOWYCH PARAMETROW
-- jesli zdeklarowac parametry to dostaniemy funkcje ktora wywoluje inna funkcje z uzycie czesci argumentow
-- a nie funkcje z uzupelnionymi parametrami
sum57C = sumABC 5 7

sumResult = sum57C 10 -- 22

-- OPERATORY TO TEZ FUNKCJE

sum59 = (+) 5 9 -- 14
 --JESLI CHCEMY UZYWAC OPEARTORA JAKO FUNKCJI TO MUSIMY UZYC NAWIASOW

performOperation op = op 3123 123

operationResult = performOperation (/)

plus1 = (+) 1 -- funkcja ktora dodaje 1 do 1 arguentu

-- funkcje 2 ARGUMENTOWE mozna wywolywac specjalnie z `` - dzieki takiemu zachowaniu dzialaja operatory matematyczne
resModulo = 5 `mod` 2 -- 1

fun x y = x * y

resFun = 4 `fun` 6 -- 24

-- map wywoluje metode (1 argument) na kazdym elementcie na liscie (2 argumnet) i zwraca przetworzona liste

doubleUp = map (*2) [1,2,3,4]

doubleUpFun = map (*2) -- funkcja kotra zawsze bedzie mnozyla razy 2
doubleFunResult = doubleUpFun [5,10,15,20]

--- filter usuwa elementy kotre nie przechodza testu
filterResult = filter (let notNull x = not (null x) in notNull) ["", "232", "", "23231412214", "dasdsa"]

compositeResult = map (*2) (filter (>25) [23,53,321,53,12,4,67] )

--fold laczy wszystkie wartosci w liscie foldr , foldl - od prawej do lewj i na odwrot
-- tak jak reduce argumenty: Funkcja_agregujaca, wartosc_poczatkowa, lista
foldlResult = foldl (/) 100 [1,2,34,5] -- 0.29
foldrResult = foldr (/) 100 [1,2,34,5] -- 340
-- TAK DZIALAJA TE FOLDY:
fold_R_Alt = (1 / (2 / (34 / (5 / 100))))
fold_L_Alt = ((((100 / 1) / 2) / 34) / 5)
-- foldl jest troche szybszy, ale nigdy nie mozna go uzyc na nieskonczonej liscie

flString = foldl (++) "start" ["asd", "test", "xxx", "123"] -- "startasdtestxxx123"
frString = foldr (++) "start" ["asd", "test", "xxx", "123"] -- "asdtestxxx123start"

-- ZIP - dobiera elementy z 2 list w pary (tuple)
zipSimple = zip [1,2,3] [4,5,6,7,8] -- [(1,4), (2,5), (3,6)] -- elementy nadmiarowe sa odrzucane

-- zipWith dobiera tak samo ale dodatkowo wykonuje operacje na elementach przekazana jako 1 argument

zipWithSimple = zipWith (*) [1,2,3] [4,5,6,7,8] -- [4,10,18]

-- zipWith3 i zipWith4 odpowiednio lacza 3 i 4 listy

-- LAMBDY
-- lambda ma format (\ .. -> ..)

filterNotNull = filter (\ x -> not(null x)) ["12321","","dfcx",""]

l = (\x -> x*x)
l_result = l 5 -- 25

-- Operatory na funkcjach
-- operator . łączy funkcje (ale musza byc zgodne z przyjowanymi i zwracanymi argumentami)

stringToUpAndReverse = map toUpper . reverse

test = stringToUpAndReverse "krol karol kupil korlowej" -- "JEWOLROK LIPUK LORAK LORK"

fun1 x = x * 2
fun2 x y = x + y

funOut = fun2 . fun1

r1 = funOut 5 2 -- 12 -- najpierw mnozy x potem dodajee y
r2 = funOut 2 5 -- 9

-- funkcje odpalane sa od prawej do lewej!

notNull = (not . null) [] -- false

-- $ operator apply - wywoluje funkcje z arumentem - mozna tak wywolywac zagniezdzane funkcjie

f1 = fun1 $ 2 -- 4

fun3 = fun2 $ fun1 $ 3
f3 = fun3 8 -- 14

-- najpierw lista funkcji potem argumenty -- mozna tak robic apply funkcji
zipApply = zipWith ($) [(+1), (*3), (\ x -> (x*2) -1)] [23,42, 21] -- [24,126,41]
