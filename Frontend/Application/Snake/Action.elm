{- mode: Elm -}
{- coding: utf-8 -}
module Snake.Action where

import Snake.Model exposing (..)


type Action
  = NoOp
  | Timer Point
  | Turn Direction
  | NewGame    
