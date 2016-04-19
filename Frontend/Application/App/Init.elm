module App.Init (init) where

{-| Init

暂时没什么暖用

-}

import Effects
import App.Action exposing (Action(..))
import App.Model  exposing (initModel)



init =
  (initModel, Effects.none)
