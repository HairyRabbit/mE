module Routing.Routes (Route(..), routerConfig, router) where

{-| Routes

路由定义

* HomeRoute     首页
* BlogsRoute    文章列表
* BlogRoute     文章
* AboutRoute    关于我
* NotFoundRoute 404页面

@todos
增加，关于我

-}

import Hop
import Hop.Types    exposing (Location, PathMatcher, Router, Config)
import Hop.Matchers exposing (match1, match2, str)



type Route
  = NotFoundRoute
  | BlogRoute String
  | BlogsRoute
  | HomeRoute
  | AboutRoute


blogMatcher : PathMatcher Route
blogMatcher =
  match2 BlogRoute "/blog/" str


blogsMatcher : PathMatcher Route
blogsMatcher =
  match1 BlogsRoute "/blog"


homeMatcher : PathMatcher Route
homeMatcher =
  match1 HomeRoute ""

aboutMatcher : PathMatcher Route
aboutMatcher =
  match1 AboutRoute "/about"


matchers : List (PathMatcher Route)
matchers =
  [ blogMatcher
  , blogsMatcher
  , homeMatcher
  , aboutMatcher
  ]


routerConfig : Config Route
routerConfig =
  { hash     = True
  , basePath = "/#/"
  , matchers = matchers
  , notFound = NotFoundRoute
  }


router : Router Route
router =
  Hop.new routerConfig
