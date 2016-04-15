module Router.Model where

import Route exposing (..)
import Router.Routes exposing (Sitemap(..))

import Post

import Debug exposing (log)


type Page
  = NotFound
  | Home
  | Posts
  | Post Post.Model

type alias Model =
  { page : Page }

routeToPath : Sitemap -> Page
routeToPath route =
  case route of
    HomeRoute () ->
      Home
    PostsRoute () ->
      Posts
    PostRoute id ->
      let
        (m, fx) = Post.initPost (log "id" id)
      in
        Post m


pathToPage : String -> Page
pathToPage path =
  case Router.Routes.match path of
    Nothing ->
      NotFound
    Just route ->
      routeToPath route
