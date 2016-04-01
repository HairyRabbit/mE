module Router.View where

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)
import Router.Routes exposing (Sitemap(..), homeRoute)
import Router.Action exposing (Action(..))
import Router.Model exposing (Model, Page(..))


type alias Linker = Sitemap -> String -> Html

notFound : Html
notFound = text "Page not found"

home : Html
home = text "Home page"

view : Signal.Address Action -> Model -> Html
view address model =
  let
    link route =
      a [ onClick address <| UpdatePath route ]
    views =
      case model.page of
        NotFound ->
          notFound
        Home -> 
          home
      
  in
    div [] [ views ]
