module Routing.Action (Action(..)) where

{-| Action

路由

* ApplyRoute 路由到时
* NavigateTo 路由跳转

-}

import Hop
import Hop.Types exposing (Location)
import Routing.Routes exposing (Route)



type Action
  = HopAction ()
  | ApplyRoute (Route, Location)
  | NavigateTo String
