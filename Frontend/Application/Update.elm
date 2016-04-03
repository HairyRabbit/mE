module Update where

import Effects exposing (Effects)
import Action  exposing (Action(..))
import Model   exposing (Model)
import Router.Update as Router
import Home.Update   as Home
import Posts.Update  as Posts


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ActionRouter act ->
      let
        (modelRouter, effectsRouter) = Router.update act model.router
      in
        ( Model modelRouter model.home model.posts
        , Effects.map ActionRouter effectsRouter
        )
    ActionHome act ->
      let
        (modelHome, effectsHome) = Home.update act model.home
      in
        ( Model model.router modelHome model.posts
        , Effects.map ActionHome effectsHome
        )
    ActionPosts act ->
      let
        (modelPosts, effectsPosts) = Posts.update act model.posts
      in
        ( Model model.router model.home modelPosts
        , Effects.map ActionPosts effectsPosts
        )
    NoOp ->
      (model, Effects.none)
