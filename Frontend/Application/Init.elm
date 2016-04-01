module Init where

import Effects exposing (Effects)
import Model exposing (Model)
import Action exposing (Action(..))
import Router.Init as Router
import Home.Init as Home


init : String -> (Model, Effects Action)
init path =
  let
    (modelRouter, effectsRouter) = Router.init path
    (modelHome, effectsHome) = Home.init

    models = Model modelRouter modelHome
    effects =
      Effects.batch
               [ Effects.map ActionRouter effectsRouter
               , Effects.map ActionHome effectsHome
               ]
  in
    (models, effects)
