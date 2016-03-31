module Hotspot.Update where

import Hotspot.Action exposing (Action(..))
import Hotspot.Model  exposing (..)
import Effects        exposing (..)
import Maybe          exposing (..)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NewHotspot hotspot ->
      case hotspot of
        Just d ->
          (d, Effects.none)
        Nothing ->
          ({ date = "", title = "", intro = "" }, Effects.none)
