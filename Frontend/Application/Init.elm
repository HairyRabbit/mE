module Init where

import Effects exposing (Effects)
import Model exposing (Model)
import Action exposing (Action(..))
import Router.Init as Router
import Home.Init as Home
import Posts.Init as Posts


init : String -> (Model, Effects Action)
init path =
  let
    (modelRouter, effectsRouter) = Router.init path
    (modelHome, effectsHome) = Home.init
    (modelPosts, effectsPosts) = Posts.init

    models = Model modelRouter modelHome modelPosts
    effects =
      Effects.batch
               [ Effects.map ActionRouter effectsRouter
               , Effects.map ActionHome effectsHome
               , Effects.map ActionPosts effectsPosts
               ]
  in
    (models, effects)
