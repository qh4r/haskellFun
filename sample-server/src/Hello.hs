{-# LANGUAGE OverloadedStrings #-}

module Hello where

import Data.Monoid (mconcat)
import Data.Text.Lazy (Text)

data Language = English | Polski
  deriving (Read)

hello :: Language -> Text
hello English = "Hello, how are you"
hello Polski = "Cześć, jak się masz"

say_hi :: Text -> Language -> Text
say_hi name language =
  mconcat [ hello language, " ", name ] -- laczy stringi , hello language to wywolanie hello z jezykiem

