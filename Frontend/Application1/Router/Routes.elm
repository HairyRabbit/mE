module Router.Routes where

import String
import Route exposing (..)

import Debug exposing (log)


type Sitemap
  = HomeRoute  ()
  | PostsRoute ()
  | PostRoute  String

homeRoute : Route Sitemap
homeRoute = HomeRoute := static ""

postsRoute : Route Sitemap
postsRoute = PostsRoute := static "posts"

postRoute : Route Sitemap
postRoute = PostRoute := "posts" <//> string

sitemap : Router Sitemap
sitemap =
  Route.router [ homeRoute, postsRoute, postRoute]

match : String -> Maybe Sitemap
match =
  Route.match sitemap

route : Sitemap -> String
route route =
  case (log "??" route) of
    HomeRoute () ->
      Route.reverse homeRoute []
    PostsRoute () ->
      Route.reverse postsRoute []
    PostRoute id ->
      Route.reverse postRoute [id]


