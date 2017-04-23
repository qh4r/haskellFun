-- IO() - to przyklad monady
-- flatmap i reverse input to przyklady monad

-- MONADA to pakowanie wartosci oraz przetwarzanie spakowanej wartosci (tak by pozostala spakowana po zakonczeniu)

-- listy maybe itd to monady

--monada ma taka deklaracje, to sparametryzowany typ
class Monad' m where
  my_return  ::  a -> m a -- my_dodane by uniknac konfiktow
  (>>>=)   ::  m a -> (a -> m b) -> m b -- odpowiednik flatMap przykladowo ~ bind
  --- !! O 1 > za duzo by nie kolidowal z Prelude.>>= !!

join :: Monad m => m (m a) -> m a
join mmx = mmx Prelude.>>= id

-- return pakuje monade
-- operator >>= rozpakowywuje monade do funkcji ktora zawira jej watosc
addMonad :: Monad m => m Int -> m Int -> m Int -- dodawanie 2 liczb na monadach
addMonad a b = a >>= (\x -> b >>= (\y -> return (x + y)))

--alternatywna skaldnia
multiplyMonad :: Monad m => m Int -> m Int -> m Int -- mnozenie 2 liczb na monadach
multiplyMonad a b = do
    x <- a
    y <- b
    return (x * y)
    -- <- dziala tak jak operator >>=

-- ponizszy kod dziala w ghci
-- return tworzy monade
--createNumber :: Monad m => Int -> m Int
--createNumber x = return x
--monadAddResult = (createNumber 5) (createNumber 10)


concatenation :: [String] ->  [String] ->  [String]
concatenation list1 list2 = do
    left <- list1 -- tutaj natrafia na liste i reszta funkcji jest wykonywana dla każdego itemu w liscie
    right <- list2 -- tutaj dzieje sie to samo
    return (left ++ " matches " ++ right) -- dlatgo dostajemy permutacje

concatenationResult = concatenation ["Ala", "Wala", "Robert", "Michal"] ["placki", "zuo", "krew", "pranie", "sranie"]