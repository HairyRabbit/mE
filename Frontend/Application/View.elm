module View where

import Html exposing (..)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.Model exposing (Page(..))
import Home.View as Home
import Nav.View as Nav

notFound : Html
notFound = text "Page not found"

view : Signal.Address Action -> Model -> Html
view address model =
  let
    views =
      case model.router.page of
        NotFound ->
          notFound
        Home ->
          Home.view (Signal.forwardTo address ActionHome) model.home
  in
    div
      []
      [ views
      , Nav.view (Signal.forwardTo address ActionRouter)
      ]
