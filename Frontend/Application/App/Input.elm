module App.Input where

import App.Action exposing (Action(..))
import Routing.Input as Routing

inputs : List (Signal Action)
inputs =
  [ Signal.map RoutingAction Routing.input
  ]
