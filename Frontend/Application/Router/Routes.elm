module Router.Routes where

import Route exposing (..)


type Sitemap
  = HomeRoute ()

homeRoute : Route Sitemap
homeRoute = HomeRoute := static ""

sitemap : Router Sitemap
sitemap =
  Route.router [ homeRoute ]

match : String -> Maybe Sitemap
match =
  Route.match sitemap

route : Sitemap -> String
route route =
  case route of
    HomeRoute () ->
      Route.reverse homeRoute []


