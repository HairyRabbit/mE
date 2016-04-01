module Update where

import Effects exposing (Effects)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.Update as Router

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ActionRouter act ->
      let
        (modelRouter, effectsRouter) = Router.update act model.router

        models = Model modelRouter
        effects =
          Effects.batch
                   [ Effects.map ActionRouter effectsRouter
                   ]
      in
        (models, effects)
    NoOp ->
      (model, Effects.none)
