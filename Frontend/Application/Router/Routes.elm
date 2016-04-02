module Router.Routes where

import String
import Route exposing (..)


type Sitemap
  = HomeRoute  ()
  | PostsRoute ()

homeRoute : Route Sitemap
homeRoute = HomeRoute := static ""

postsRoute : Route Sitemap
postsRoute = PostsRoute := static "posts"

sitemap : Router Sitemap
sitemap =
  Route.router [ homeRoute, postsRoute ]

match : String -> Maybe Sitemap
match =
  Route.match sitemap

route : Sitemap -> String
route route =
  case route of
    HomeRoute () ->
      Route.reverse homeRoute []
    PostsRoute () ->
      Route.reverse postsRoute []


