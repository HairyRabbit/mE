module View where

import Html exposing (..)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.Model exposing (Page(..))

import Notfound.View as Notfound
import Nav.View      as Nav
import Home.View     as Home
import Posts.View    as Posts



notFound : Html
notFound = text "Page not found"

view : Signal.Address Action -> Model -> Html
view address model =
  let
    views =
      case model.router.page of
        Home ->
          Home.view (Signal.forwardTo address ActionHome) model.home <| Nav.view (Signal.forwardTo address ActionRouter) "home"

        Posts ->
          Posts.view (Signal.forwardTo address ActionPosts) model.posts <| Nav.view (Signal.forwardTo address ActionRouter) "posts"

        NotFound ->
          Notfound.view
  in
    views
