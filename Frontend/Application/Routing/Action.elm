module Routing.Action where

import Hop
import Hop.Types exposing (Location)
import Routing.Routes exposing (Route)


type Action
  = HopAction ()
  | ApplyRoute (Route, Location)
  | NavigateTo String
