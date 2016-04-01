module Hotspot.Update where

import Hotspot.Action exposing (Action(..))
import Hotspot.Model  exposing (Model, initModel)
import Effects        exposing (Effects)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NewHotspot hotspot ->
      case hotspot of
        Just d ->
          (d, Effects.none)
        Nothing ->
          (initModel, Effects.none)
