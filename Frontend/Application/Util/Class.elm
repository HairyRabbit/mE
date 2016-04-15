module Util.Class where

{-| 以一个愉快的方式组合样式 -}

import Html            exposing (..)
import Html.Attributes exposing (..)

(|-|) : String -> String -> String
(|-|) c1 c2 =
  c1 ++ " " ++ c2

infixr 5 |-|

class2 : String -> String -> Attribute
class2 a b = class <| a |-| b

class3 : String -> String -> String -> Attribute
class3 a b c = class <| a |-| b |-| c
