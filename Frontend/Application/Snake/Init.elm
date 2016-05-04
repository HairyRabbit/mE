{- mode: Elm -}
{- coding: utf-8 -}
module Snake.Init where

import Snake.Module exposing (..)

snake1 : Point
snake1 =
  { x = 0
  , y = 0
  }

snake2 : Point
snake2 =
  { x = 0
  , y = -1
  }

snake3 : Point
snake3 =
  { x = 0
  , y = -2
  }

snake4 : Point
snake4 =
  { x = 0
  , y = -3
  }  

initSnake : Snake
initSnake =
  { front = [ snake1, snake2, snake3, snake4 ]
  , back  = []
  }

  
initDir : Direction
initDir =
  Bottom


initFood : Maybe Point
initFood =
  Nothing


initState : SnakeState    
initState =
  { snake  = initSnake
  , dir    = initDir
  , food   = initFood
  , timer  = 0
  , isDone = False
  }  
