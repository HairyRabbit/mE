module Routing.Action where

import Hot.Types exposing (Location, Route)


type Action
  = HopAction ()
  | ApplyRoute (Route, Location)
  | NavigateTo String
