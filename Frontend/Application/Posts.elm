module Application.Posts (view) where

import Html exposing (..)
import Html.Attributes exposing (..)

import Application.Style.Flex exposing (..)
import Application.Sitemap exposing (..)
import Application.View.Posts.Header as Header


view : Html
view =
  main'
    [ mainLayout ]
    []


mainLayout : Attribute
mainLayout =
  style [ ("width", "82rem")
        , ("height", "100%")
        , ("position", "relative")
        ]

leftLayout : Attribute
leftLayout =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("bottom", "0")
        , ("left", "0")
        , ("width", "20%")
        ]

rightLayout : Attribute
rightLayout =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("bottom", "0")
        , ("right", "0")
        , ("width", "20%")
        ]

middleLayout : Attribute
middleLayout =
  style [ ("padding", "22rem 24% 0") ]


