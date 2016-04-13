module Routing.Routes where

import Hop
import Hop.Types    exposing (Location, PathMatcher, Router)
import Hop.Matchers exposing (match1, match2, str)

import Blog.Model   exposing (PostID)


type Route
  = NotFoundRoute
  | BlogRoute PostID

blogMatcher : PathMatcher Route
blogMatcher =
  match2 BlogRoute "/blog/" str

matchers : List (PathMatcher Route)
matchers =
  [ blogMatcher
  ]

router : Router Route
router =
  Hop.new
    { matchers = matchers
    , notFound = NotFoundRoute
    }
