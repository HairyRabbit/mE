module Routing.Input where

import Routing.Action exposing (Action(..))
import Routing.Routes exposing (router)


input : Signal Action
input =
  Signal.map ApplyRoute router.signal
