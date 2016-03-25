module Application.View.Posts.Header (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.Sitemap exposing (..)
import Application.View.Header.Header as Header

view : Html
view =
  section
    [ headerStyle ]
    [ Header.view (PostsR ()) Header.Left ]


headerStyle : Attribute
headerStyle =
  style <| flexStyle flexCenter
