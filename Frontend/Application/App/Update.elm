module App.Update where

import Effects exposing (Effects)
import App.Action exposing (Action(..))
import App.Model exposing (Model)
import Routing.Update as Routing
import Blog.Update as Blog
import Home.Update as Home

import Debug

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RoutingAction act ->
      let
        (m, fx, fxBlog, fxHome) = Routing.update act model.routing
        
        effects =
          Effects.batch
            [ Effects.map RoutingAction fx
            , Effects.map BlogAction fxBlog
            , Effects.map HomeAction fxHome
            ]
      in
        ( { model | routing = m }
        , effects
        )
        
    BlogAction act ->
      let
        (m, fx) = Blog.update act model.blog
      in
        ( { model | blog = m }
        , Effects.map BlogAction fx
        )

    HomeAction act ->
      let
        (m, fx) = Home.update act model.home
      in
        ( { model | home = m }
        , Effects.map HomeAction fx
        )
        
    _ ->
      (model, Effects.none)
