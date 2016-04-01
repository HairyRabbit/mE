module Home.Init where

import Home.Model exposing (Model)
import Home.Action exposing (Action(..))
import Hotspot.Init as Hotspot
import Effects

init : (Model, Effects.Effects Action)
init =
  let
    (m, fx) = Hotspot.init
  in
    ( Model m
    , Effects.batch
        [ Effects.map ActionHotspot fx
        ]
    )
