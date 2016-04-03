module Util.Classes where

import Html.Attributes exposing (..)

(|-|) : String -> String -> String
(|-|) c1 c2 =
  c1 ++ " " ++ c2

infixr 5 |-|
