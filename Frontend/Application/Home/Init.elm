module Home.Init where

import Effects exposing (Effects)
import Home.Model exposing (Model)
import Home.Action exposing (Action(..))
import Hotspot.Init as Hotspot


init : (Model, Effects Action)
init =
  let
    (m, fx) = Hotspot.init
  in
    ( Model m
    , Effects.batch
        [ Effects.map ActionHotspot fx
        ]
    )
