module Routing.Update (update) where

{-| Update

路由动作，定义了路由到时的一些逻辑，比如页面加载时请求数据

-}

import Effects        exposing (Effects)
import Hop.Navigate   exposing (navigateTo)
import Routing.Action exposing (Action(..))
import Routing.Model  exposing (Model)
import Routing.Routes exposing (Route(..), routerConfig)
import Blog.Effects   exposing (fetchPost)
import Blogs.Effects  exposing (fetchPosts)
import Home.Effects   exposing (fetchTop)
import Blog.Action    as Blog
import Blogs.Action   as Blogs
import Home.Action    as Home



type alias ParentsActions =
  { blog  : Effects Blog.Action
  , blogs : Effects Blogs.Action
  , home  : Effects Home.Action
  }


noneParentsActions : ParentsActions
noneParentsActions =
  { blog  = Effects.none
  , blogs = Effects.none
  , home  = Effects.none
  }


update : Action -> Model -> (Model, Effects Action, ParentsActions)
update action model =
  case action of
    NavigateTo path ->
      let
        fx =
          Effects.map HopAction <| navigateTo routerConfig path
      in
        (model, fx, noneParentsActions)

    ApplyRoute (route, location) ->
      let
        fx =
          case route of
            BlogRoute id ->
              { noneParentsActions | blog  = fetchPost id }
            BlogsRoute ->
              { noneParentsActions | blogs = fetchPosts }
            HomeRoute ->
              { noneParentsActions | home  = fetchTop }
            _ ->
              noneParentsActions

        m = { model | route = route, location = location
            }
      in
        (m, Effects.none, fx)

    HopAction () ->
      (model, Effects.none, noneParentsActions)
