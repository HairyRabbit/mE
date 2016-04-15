module App.Init where

import Effects
import App.Action exposing (Action(..))
import App.Model exposing (initModel)


init =
  (initModel, Effects.none)
