{- mode: Elm -}
{- coding: utf-8 -}
module Snake.Model where

type alias Point =
  { x : Int
  , y : Int
  }

type Direction
  = Top
  | Right
  | Bottom
  | Left

type alias Snake =
  { front : List Point
  , back  : List Point
  }

type alias SnakeState =
  { snake  : Snake
  , dir    : Direction
  , target : Maybe Point
  , timer  : Int
  , isDone : Bool
  }
