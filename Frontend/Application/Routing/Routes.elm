module Routing.Routes where

import Hop
import Hop.Types    exposing (Location, PathMatcher, Router, Config)
import Hop.Matchers exposing (match1, match2, str)


type Route
  = NotFoundRoute
  | BlogRoute String
  | HomeRoute


blogMatcher : PathMatcher Route
blogMatcher =
  match2 BlogRoute "/blog/" str

homeMatcher : PathMatcher Route
homeMatcher =
  match1 HomeRoute ""


matchers : List (PathMatcher Route)
matchers =
  [ blogMatcher
  , homeMatcher
  ]


routerConfig : Config Route
routerConfig =
  { hash     = True
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute
  }  


router : Router Route
router =
  Hop.new routerConfig


