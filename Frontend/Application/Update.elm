module Update where

import Effects exposing (Effects)
import Action  exposing (Action(..))
import Model   exposing (Model)
import Router.Update as Router
import Home.Update   as Home


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ActionRouter act ->
      let
        (modelRouter, effectsRouter) = Router.update act model.router
      in
        ( Model modelRouter model.home
        , Effects.map ActionRouter effectsRouter
        )
    ActionHome act ->
      let
        (modelHome, effectsHome) = Home.update act model.home
      in
        ( Model model.router modelHome
        , Effects.map ActionHome effectsHome
        )
    NoOp ->
      (model, Effects.none)
