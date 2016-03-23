module Application.View.Posts.Posts (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.Sitemap exposing (..)
import Application.View.Posts.Header as Header
import Application.View.Home.Nav as Nav
import Application.View.Posts.Hello as Hello

view : Html
view =
  main'
    [ mainLayout ]
    [ section
        [ leftLayout ]
        []
    , section
        [ rightLayout ]
        [ Header.view
        -- , Nav.view link1 link2
        , Hello.view
        ]
    ]

mainLayout : Attribute
mainLayout =
  style <| [ ("width", "64rem")
           , ("height", "100%")
           , ("position", "relative")
           ] ++ flexStyle flex

leftLayout : Attribute
leftLayout =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter

rightLayout : Attribute
rightLayout =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter

middleLayout : Attribute
middleLayout =
  style [ ("padding", "22rem 24% 0") ]


