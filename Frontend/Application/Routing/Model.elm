module Routing.Model (Model, initModel) where

{-| Model

路由，初次加载跳转到 HomeRoute

-}

import Hop
import Hop.Types      exposing (Location, newLocation)
import Routing.Routes exposing (Route(..))



type alias Model =
  { location : Location
  , route    : Route
  }


initModel : Model
initModel =
  { location = newLocation
  , route    = HomeRoute
  }
