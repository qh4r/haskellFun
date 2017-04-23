{-# LANGUAGE OverloadedStrings #-}

-- cabal install --only-dependencies - instaluje zaleznosci
-- cabal configure - konfiguruje paczke do budowy
-- cabal build -- buduje exek
-- przykladowe urle http://127.0.0.1:3000/English/Arnold, http://127.0.0.1:3000/Polski/Rafal
module Main where

import Web.Scotty
import Data.Monoid(mconcat)
import Hello

main = scotty 3000 $ do
  get "/:language/:name" $ do
    name <- param "name"
    languageString <- param "language"
    let language = read languageString
    html $ mconcat ["<h2>", say_hi name language, "</h2>"]