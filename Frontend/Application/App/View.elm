module App.View where

import Html           exposing (..)
import App.Action     exposing (Action(..))
import App.Model      exposing (Model)
import Routing.Routes as Routing
import Blog.View      as Blog
import Blogs.View     as Blogs
import Home.View      as Home

import Debug

view : Signal.Address Action -> Model -> Html
view address model =
  let
    _ =
      Debug.log "model" model

    view =
      case model.routing.route of
        Routing.BlogRoute id ->
          Blog.view (Signal.forwardTo address BlogAction) model.blog

        Routing.BlogsRoute ->
          Blogs.view (Signal.forwardTo address BlogsAction) model.blogs
              
        Routing.HomeRoute ->
          Home.view (Signal.forwardTo address HomeAction) model.home
              
        _ ->
          div [] [ text "notFound" ]
  in
    view
