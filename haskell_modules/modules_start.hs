import qualified Data.Set
import qualified Data.Sequence as Seq -- alias Seq zastepuje Data.Sequence -> Data.Sequence przestaje być możliwe do użycia
--import qualified Data.Set (empty) -- zimportowalo by tylko metody empty
--import qualified Data.Set hiding (empty) -- zimportowalo by wszystko tylko nie metode empty

import Prelude  -- domyslnie importowany moduł,  tak naprawde nie trzeba go generowac.
                -- Zawiera wbudowane funkcje jak map zip fold
import My.First
-- qualified sprawia ze konieczne jest uzywanie pelnych sciezek - samo empty nie zadziala gdy qualified.instance
-- to mądre bo w haskelu łatwo o konflikty

test = Data.Set.empty -- pusty set
test2  = Seq.empty

firstResult = My.First.funTest 2
firstTypeInstance = My.First.TestType "TOmasz" "ASD"