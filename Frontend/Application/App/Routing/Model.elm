module Routing.Model where

import Hot.Types exposing (Location, Route)
import Routing.Routes exposing (Route(BlogRoute))

type alias Model =
  { location : Location
  , route : Route
  }

initModel : Model
initModel =
  { location = newLocation
  , route : BlogRoute ""
  }
