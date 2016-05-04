{- mode: Elm -}
{- coding: utf-8 -}
module Snake.Update where

import Snake.Action exposing (..)
import Snake.Model exposing (..)


boardSize : Int
boardSize =
  15

boxSize : Int
boxSize =
  boardSize * 2 + 1

velocity : Int
velocity =
  5
