module Home.Init where

import Home.Model
import Home.Action
import Hotspot.Model
import Hotspot.Init
import Effects

init : (Home.Model.Model, Effects.Effects Home.Action.Action)
init =
  let
    (m, fx) = Hotspot.Init.init
  in
    ( Home.Model.Model m
    , Effects.batch
        [ Effects.map Home.Action.ActionHotspot fx
        ]
    )
