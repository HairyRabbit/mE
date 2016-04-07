module Init where

import Effects exposing (Effects)
import Model exposing (Model)
import Action exposing (Action(..))
import Router.Init as Router
import Home.Init as Home
import Posts.Init as Posts
import Router.Routes as Routes

import Blog

import Debug exposing (log)


init : String -> (Model, Effects Action)
init path =
  let
    (modelRouter, effectsRouter) = Router.init path
    (modelHome, effectsHome) = Home.init
    (modelPosts, effectsPosts) = Posts.init
    (modelBlog, effectsBlog) = Blog.init
    logs = (log "xx" <| toString <| Routes.match path)
    models = Model modelRouter modelHome modelPosts modelBlog
    effects =
      Effects.batch
               [ Effects.map ActionRouter effectsRouter
               , Effects.map ActionHome effectsHome
               , Effects.map ActionPosts effectsPosts
               , Effects.map ActionBlog effectsBlog
               ]
  in
    (models, effects)
