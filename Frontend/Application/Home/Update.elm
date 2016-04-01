module Home.Update where

import Home.Action
import Home.Model
import Hotspot.Update
import Effects

update : Home.Action.Action -> Home.Model.Model -> (Home.Model.Model, Effects.Effects Home.Action.Action)
update action model =
  case action of
    Home.Action.ActionHotspot act ->
      let
        (m, fx) = Hotspot.Update.update act model.hotspot
      in
      ( Home.Model.Model m
      , Effects.map Home.Action.ActionHotspot fx
      )
