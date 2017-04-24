-- podtyp state

import Control.Monad.ST

-- data ST s resultOfComputation -- s to wartosc pomocnicza
-- instance Monad (ST a)
-- funkcje
-- runST :: ST s a -> a

import Data.STRef

-- data STRef s a -- referencja do typu a, s to odpowiednik pomocnika w st i nie pozwala uzyc danego typu z innym STrefem
-- funkcje
-- newSTRef :: a -> ST s (STRef s a)
-- readSTRef :: STRef s a -> ST s a
-- writeSTRef :: STRef s a -> a -> ST s ()