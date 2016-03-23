module Application.View.Posts.Hello (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)

view : Html
view =
  section
    [ helloStyle ]
    [ img [ imageStyle
          , src imagePath
          ] []
    ]

helloStyle : Attribute
helloStyle =
  style <| flexStyle flexCenter

imagePath : String
imagePath =
  "./Image/Cat.jpg"

imageStyle : Attribute
imageStyle =
  style [ ("width", "60%")
        , ("height", "auto")
        ]
