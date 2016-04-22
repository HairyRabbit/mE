module Routing.Update (update) where

{-| Update

路由动作，定义了路由到时的一些逻辑，比如页面加载时请求数据

@todo
将 home 和 blogs 的请求并入到 App.Init 中

@todo
blog/:id 的元信息不再发送请求，从 model.blogs.posts 中取

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
import App.Model      as App

import Debug exposing (log)


type alias ParentsActions =
  { blog  : Effects Blog.Action
  , blogs : Effects Blogs.Action
  , home  : Effects Home.Action
  }


initParentsActions : ParentsActions
initParentsActions =
  { blog  = Effects.none
  , blogs = Effects.none
  , home  = Effects.none
  }


update : Action -> App.Model -> (Model, Effects Action, ParentsActions)
update action model =
  case action of
    NavigateTo path ->
      let
        fx =
          Effects.map HopAction <| navigateTo routerConfig path
      in
        (model.routing, fx, initParentsActions)

    ApplyRoute (route, location) ->
      let
        fx =
          case route of
            BlogRoute id ->
              case model.blog.post.id of
                "" ->
                  { initParentsActions | blog  = fetchPost id }
                _ ->
                  initParentsActions
                    
            BlogsRoute ->
              case model.blogs.posts of
                [] ->
                  { initParentsActions | blogs = fetchPosts }
                _ ->
                  initParentsActions
                    
            HomeRoute ->
              case model.home.post.id of
                "" ->
                  { initParentsActions | home  = fetchTop }
                _ ->
                  initParentsActions
              
            _ ->
              initParentsActions


        m' = model.routing
        m = { m' | route = route, location = location }
      in
        (m, Effects.none, fx)

    HopAction () ->
      (model.routing, Effects.none, initParentsActions)
