module View where

import Html exposing (..)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.Model exposing (Page(..))
import Home.View as Home

notFound : Html
notFound = text "Page not found"

view : Signal.Address Action -> Model -> Html
view address model =
  case model.router.page of
    NotFound ->
      notFound
    Home ->
      Home.view (Signal.forwardTo address ActionHome) model.home
