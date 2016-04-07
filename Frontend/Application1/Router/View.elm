module Router.View where

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Router.Routes exposing (Sitemap(..), homeRoute)
import Router.Action exposing (Action(..))
import Router.Model exposing (Model, Page(..))
import Home.View as Home
import Action as RootAction
import Model as RootModel


type alias Linker = Sitemap -> String -> Html

notFound : Html
notFound = text "Page not found"

home : Html
home = text "Home page"

view : Signal.Address RootAction.Action -> RootModel.Model -> Html
view address model =
  let
    {-
    link route =
      a [ onClick address <| UpdatePath route ]
    -}
    views =
      case model.router.page of
        NotFound ->
          notFound
        Home ->
          Home.view (Signal.forwardTo address RootAction.ActionHome) model.home

  in
    div [] [ views ]
