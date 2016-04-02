module Input where

{-| Input mix -}

import Action exposing (Action)
import Router.Input as Router


input : List (Signal Action)
input =
  [ Router.input
  ]
