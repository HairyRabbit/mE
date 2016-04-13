module Routing.Model where

import Hop
import Hop.Types exposing (Location, newLocation)
import Routing.Routes exposing (Route(..))

type alias Model =
  { location : Location
  , route : Route
  }

initModel : Model
initModel =
  { location = newLocation
  , route    = BlogRoute "1"
  }
