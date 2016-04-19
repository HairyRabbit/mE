module App.Input (inputs) where

{-| Input

组合所有 Input

-}

import App.Action    exposing (Action(..))
import Routing.Input as Routing



inputs : List (Signal Action)
inputs =
  [ Signal.map RoutingAction Routing.input
  ]
