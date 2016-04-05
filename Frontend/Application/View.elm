module View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.Model exposing (Page(..))
import Router.Action as Router

import Notfound.View as Notfound
import Nav.View      as Nav
import Home.View     as Home
import Posts.View    as Posts


view : Signal.Address Action -> Model -> Html
view address model =
  let

    linkAddress =
      Signal.forwardTo address ActionRouter

    link route =
      a [ onClick linkAddress <| Router.UpdatePath route ]

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
