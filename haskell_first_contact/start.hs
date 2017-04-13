-- BASICS, LISTS, TUPLES, GUARDS, CASES, PATTERN MATCHING, LAZY EVALUATION, LET IN

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

-- W HASKELU NIE MA PETLI

-- listy

x = [1,2,3]
y = 4 : x-- laczenie list y zawiera 4 eleemnty

-- string to lista znakow
str = "abcd"
str2 = 'a':'b':'c':'d':[] -- '' uzywamy do charow

-- FUNKCJE I WSZYSTKIE WYRAZENIA ZWIAJA SIE OD KONCA
-- DLATEGO POWYZEJ DAJEMY NAJPIERW TABLICE A POTEM WSTAWIAMY DO NIEJ ELEMENTY
-- OSTATNIM ARGUMENTEM : musi byc tablica

str_res = str == str2 -- true

-- ++ - konkatenacja
-- STRING TO TABLICA CHAROW

tab = y ++ [7,8,9] -- [4,1,2,3,7,8,9]

-- LISTY MUSZA MIEC 1 TYP ELEMENTOW
-- asd = ["asd",23, 42.2]  -- nie mozna

-- nie mozna 2 razy przypisac do tego samego
--x = [1,2,3]
t = [1,2,3]
ht = head t -- 1
tt = tail t --2,3

-- null sprawdza obecnosc elementow!
null_empty_arr = null [] --true
null_full_arr = null [2,3] --false

-- ITERACJA PO ELEMENTACH FUNKCJI POLEGA NA WYKONYWANIU OPERACJI NA 1 ELEMENCIE - HEAD
-- I PRZEKAZYWANIU REKURENCYJNIE RESZTY ELEMENTOW, A POTEM WRACAJAC SKLADANIU ICH W LISTE
-- DLATEGO NA KONCU GDY NULL ZWARACAMY THEN I MAMY 1_st : 2_nd : ... : n_th-1 : nt_th : []
double_numbers numbers =
    if null numbers
    then []
    else (2 * (head numbers)) : (double_numbers (tail numbers))

--usuwanie elementow nieparzystych
-- mod WARTOSC MODULO
remove_even list =
    if null list
    then []
    else if (mod (head list) 2) == 1
        then (head list) : (remove_even(tail list))
        else remove_even(tail list)


-- TUPLES
tuple = (1, "asd", 2.32, [1,2,3]) -- moga trzymac rozne typy

return_tuple list = ((head list), (length list))

res_tuple = return_tuple [1,23,57] -- (1,3)
-- fst i snd pozwalaja odwolywac sie do elementow tupli
first_tuple_part = fst res_tuple -- 1
second_tuple_part = snd res_tuple -- 3
-- POWYZSZE METODY DZIALAJA DLA TUPLI 2 ELEMENTOWYCH

-- LEPIEJ NIE NADUZYWAC TUPLI

-- patter mathing - access do tupli i list

-- sugerujemy ze input to tuple i wybieramy element - troche taka destrukturyzacja
fst' (a,b,c,d) = a
trd' (a,b,c,d) = c

trd_l [a,b,c] = c

-- PATTERN MATCHING DZIALA TYLKO DLA DOKLADNIEJ ILOSCI ZADEKLAROWANYCH ELEMENTOW

head' (h: rest) = h
head' [] = error "list is empty"
tail' (h: rest) = rest
tail' [] = error "list is empty"

-- Funkcje z (:) obsluguja listy
-- mozna deklarowac funkcje kilka razy z roznymi formatami patternow i beda wtedy obslugiwaly rozne przypadki

null' [] = True
null' (x: rest) = False

-- remove_even  na tuplach

remove_even_tuple [] = []
remove_even_tuple (x : xs) =
    if (mod x 2) == 1
        then x : (remove_even_tuple xs)
        else remove_even_tuple xs

-- guardsy - pozwalaja na unikniecie ifow! OTHERWISE JEST JAK DEFAULT W SWITCHU

double_list_alt list
    | null list = []
    | otherwise = (2 * (head list)) : double_list_alt (tail list)

-- remove odd dla odmiany

remove_odd [] = []
remove_odd (x : end)
    | (mod x 2) == 0 = x : (remove_odd end)
    | otherwise = remove_odd(end)

--  case - to alternatywa dla guardow

double_list_case list = case list of
    []      ->  []
    (x: t)  ->  (x * 2) : (double_list_case t)

-- wykorzystanie remove odd w celu stwierdzenia czy lista zawiera jakiekolwiek parzyste  elementy

containsEven list = case (remove_odd list) of
    []          ->  False
    (x : rest)  ->  True

--  nie mozna uzywac case i guarda naraz :((

-- lokalne zmienne zapisujemy z letem - zmienne sa niezmienne! zmienne mozna tylko tworzyc w scopie -np funkcji

fun =
    let a = 5
        b = 4
    in a + b -- zwroci 9

--let zawsze wystepuje z in

countEven list =
    let even = remove_odd list
    in ((length even), (length list))


-- where binding pozwala nam dawac wartosci domyslne do funkcji

testWhere = 2*a
    where a = 5

-- where srednio ma sens

-- LAZY EVAL

-- W HASKELU FUNKCJE SA WYWOLYWANE TYLKO JESLI ZOSTANA UZYTE WARTOSCI KOTRE MAJA WYWOLAC

--Tworzenie nieskonczonej listy
createInfiniteList n = n : createInfiniteList(n+1)

infiniteList = createInfiniteList 1
--haskel moze spokojnie operowac na jej elementach bez ewaluowania calosci

part = take 10 infiniteList
-- takie wywolanie zewaluuje tylko 10 elementow
-- wywolania tail albo length sprawia ze program wpadnie w nieskonczona petle

infiniteOdd = remove_even infiniteList

partOdd = take 10 infiniteOdd -- TO TEZ ZADZIALA!! haskel wywoluje leniwie funkcje i wywola remove_even tylko na tylu
-- elementach by spelnic wymaganie take 10!