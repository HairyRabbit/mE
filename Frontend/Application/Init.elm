module Init where

import Effects exposing (Effects)
import Model exposing (Model)
import Action exposing (Action(..))
import Router.Init as Router


init : String -> (Model, Effects Action)
init path =
  let
    (modelRouter, effectsRouter) = Router.init path

    models = Model modelRouter
    effects =
      Effects.batch
               [ Effects.map ActionRouter effectsRouter
               ]
  in
    (models, effects)
