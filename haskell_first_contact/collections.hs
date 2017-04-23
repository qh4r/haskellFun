{-# LANGUAGE ViewPatterns #-}
-- to language extension pomagajacy z Sequencem

-- wszystkie kolekjce sa niemutowalne i wymagaja tworzenia ich kopii przy zmianie zawartosci

-- tak naprawde kolejne kopie to funkcyjne reprezentacje różnic pomiędzy kolejnymi kolekcjami
-- (takie podjescie jest bezpieczne gdyż źródłowe kolekcje nigdy nie mogą zostać zmodyfikowane)

import qualified Data.Set as Set
import qualified Data.Map as Map
import qualified Data.Sequence as Seq

setTemp = foldr Set.insert Set.empty [1,42,45,231,5214,12,14,21,21]
                                            -- musi byc fold r bo bierzemy liczbe a pote set za kazdym razem
                                            -- (patrz ponizej kolejnosc argumentow)
set1 = Set.insert 123 setTemp

set2 = Set.delete 42 (foldr Set.insert Set.empty [1,42,45,3232,5214,43,21,21])

setResult = Set.union set1 set2 -- elementy 2 setow bez powtarzajacych sie
setMember42 = Set.member 42 setResult -- true


-- mapa ma klucz i wartosc
map1 = foldr (\(key, val) -> Map.insert key val) Map.empty [(1, "CUkier"),(3, "Slodkosci"),(6, "Slicznosci"),(10, "SMieci")]
map2 = Map.insert 1 "ZMIANA" map1
map3 = Map.delete 3 map2
-- union dziala tak jak dla setu
-- UNION ZAWSZE PREFERUJE LEWĄ WARTOŚ
search1 = Map.lookup 6 map3 -- Just "Slicznosci"
search2 = Map.lookup 3 map3 -- Nothing

-- Seq jest jak lista z mozliwoscia pushy popow itd

-- <| - dodaje do konca |> - dodaje do poczatku Seqence
seq1 = foldr (Seq.<|) Seq.empty [2,4,12,51,5,12,5,1,35];
seq2 = seq1 Seq.|> 105
seq3 = seq1 Seq.>< seq2 -- konkatenacja

