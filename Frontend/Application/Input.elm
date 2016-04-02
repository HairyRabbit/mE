module Input where

import Action exposing (Action)
import Router.Input as Router


input : List (Signal Action)
input =
  [ Router.input
  ]
