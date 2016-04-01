module Application.View.Header.Header where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.Sitemap exposing (..)
import Application.View.Header.Logo as Logo
import Application.View.Header.Greet as Greet
import Application.View.Header.Intro as Intro

type RouteViewDirection = Left | Right

view : Sitemap -> RouteViewDirection -> Html
view sitemap dir =
  let
    greet =
      case sitemap of
        HomeR ()  -> "Welcome"
        PostsR () -> "Blog"
        AboutR () -> "About"
    layoutContainer = headerLayout dir
    layoutRightPart = headerRightLayout dir
  in
    header
      [ layoutContainer ]
      [ section
          [ headerLeftLayout ]
          [ Logo.view ]
      , section
          [ layoutRightPart  ]
          [ Greet.view greet
          , Intro.view
          ]
      ]


headerLayout : RouteViewDirection -> Attribute
headerLayout dir =
  let
    layout =
      case dir of
        Left  -> flex
        Right -> flexRowReverse
  in
    style <| flexStyle layout


headerLeftLayout : Attribute
headerLeftLayout =
  style <| flexStyle flexCenter


headerRightLayout : RouteViewDirection -> Attribute
headerRightLayout dir =
  let
    layout =
      case dir of
        Left  -> flexColumn
        Right -> flexColumnEnd
  in
    style <| flexStyle layout
