module App.View (view) where

{-| View

组合所有 View

-}

import Html           exposing (..)
import App.Action     exposing (Action(..))
import App.Model      exposing (Model)
import Routing.Routes as Routing
import Blog.View      as Blog
import Blogs.View     as Blogs
import Home.View      as Home
import NotFound.View  as NotFound



view : Signal.Address Action -> Model -> Html
view address model =
  let
    view =
      case model.routing.route of
        Routing.BlogRoute id ->
          Blog.view (Signal.forwardTo address BlogAction) model.blog

        Routing.BlogsRoute ->
          Blogs.view (Signal.forwardTo address BlogsAction) model.blogs

        Routing.HomeRoute ->
          Home.view (Signal.forwardTo address HomeAction) model.home

        _ ->
          NotFound.view
  in
    div [] [ view ]
