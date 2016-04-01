module Router.Model where

import Route exposing (..)
import Router.Routes exposing (Sitemap(..))


type Page
  = NotFound
  | Home

type alias Model =
  { page : Page }

routeToPath : Sitemap -> Page
routeToPath route =
  case route of
    HomeRoute () ->
      Home

pathToPage : String -> Page
pathToPage path =
  let
    dpath =
      case path of
        "" ->
          "/"
        _ ->
          path
  in
    case Router.Routes.match dpath of
      Nothing ->
        NotFound
      Just route ->
        routeToPath route
