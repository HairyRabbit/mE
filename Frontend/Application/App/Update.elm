module App.Update (update) where

{-| Update

路由所有 Update

-}

import Effects        exposing (Effects)
import App.Action     exposing (Action(..))
import App.Model      exposing (Model)
import Routing.Update as Routing
import Blog.Update    as Blog
import Blogs.Update   as Blogs
import Home.Update    as Home



update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RoutingAction act ->
      let
        (m, fx, pfx) = Routing.update act model.routing

        fx' =
          Effects.batch
            [ Effects.map RoutingAction fx
            , Effects.map BlogAction    pfx.blog
            , Effects.map BlogsAction   pfx.blogs
            , Effects.map HomeAction    pfx.home
            ]
      in
        ( { model | routing = m }
        , fx'
        )

    BlogAction act ->
      let
        (m, fx) = Blog.update act model.blog
      in
        ( { model | blog = m }
        , Effects.map BlogAction fx
        )

    BlogsAction act ->
      let
        (m, fx) = Blogs.update act model.blogs
      in
        ( { model | blogs = m }
        , Effects.map BlogsAction fx
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
